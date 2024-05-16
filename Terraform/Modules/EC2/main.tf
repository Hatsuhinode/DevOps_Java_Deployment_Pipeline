resource "aws_vpc" "myvpc" {
    cidr_block = var.myvpc_cidr

    tags = {
      Name = var.myvpc_name
    }
  
}


resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.mysubnet_cidr
    availability_zone = var.mysubnet_availabilityZone
    map_public_ip_on_launch = true

    tags = {
        Name = var.mysubnet_name
    }
   
  
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id

    tags = {
      Name = var.igw_name
    }
  
}


resource "aws_route_table" "r_table" {
    vpc_id = aws_vpc.myvpc.id

    route {
        cidr_block = var.destination_cidr      # Destination CIDR block for the route used for directing traffic intended for the internet from within the VPC
        gateway_id = aws_internet_gateway.igw.id    #  ID of the gateway to which the traffic ( from inside the VPC) matching the CIDR block will be routed
       
    }
                                                    
}


resource "aws_route_table_association" "r_table_linking" {
    subnet_id = aws_subnet.mysubnet.id
    route_table_id = aws_route_table.r_table.id
  
}


resource "aws_security_group" "sg" {
    name = "Allow_HTTP"
    description = "Allow HTTP inbound traffic "

    vpc_id = aws_vpc.myvpc.id

    ingress {
        description = "HTTP traffic"
        from_port = 80  # HTTP traffic (using TCP protocol) from port 80(Outside VPC) to port 80 (Inside VPC) is allowed
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH traffic"

        from_port = 22   # SSH traffic (using TCP protocol) from port 80(Outside VPC) to port 80 (Inside VPC) is allowed
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Jenkins Server"

        from_port = 8080  
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Outbound taffic"

        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        # All outbound traffic (represented by -1 for all protocols) with a source port and destination port of 0 is allowed to any destination IP address (0.0.0.0/0)
        # from_port and to_port: These parameters specify the range of port numbers for the outbound traffic allowed by the egress rule. In this case, both are set to 0, which means that the rule applies to all ports.


    }

    tags = {
      Name = "HTTP_sg"
    }
  
}


resource "aws_key_pair" "KeyValue" {
    key_name = var.Key_Name
    public_key = file(var.Public_Key_Path)
  
}


resource "aws_instance" "myEC2instance" {
    ami = var.ami_type
    instance_type = var.ec2Instance_type
    key_name = aws_key_pair.KeyValue.key_name
    subnet_id = aws_subnet.mysubnet.id
    vpc_security_group_ids = [aws_security_group.sg.id]

    tags = {
      Name = var.instanceName
    }

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file(var.Private_Key_Path)
      host = self.public_ip
    }

    provisioner "file" {
    source = "../../Ansible"
    destination = "/home/ubuntu/ansiblePlaybooks"

}

provisioner "remote-exec" {
    inline = [
        "sudo apt update -y",
        "sudo apt install ansible -y",
    ]

}

provisioner "local-exec" {
  command = "ansible-playbook -i ${self.public_ip}, --private-key ${var.Private_Key_Path} '../../Ansible/Java.yml' && ansible-playbook -i ${self.public_ip}, --private-key ${var.Private_Key_Path} '../../Ansible/Jenkins.yml'"
#  command = "ansible-playbook -i ${self.public_ip}, --private-key ${var.Private_Key_Path} '../../Ansible/Java.yml' && ansible-playbook -i ${self.public_ip}, --private-key ${var.Private_Key_Path} '../../Ansible/Jenkins.yml' && ansible-playbook -i ${self.public_ip}, --private-key ${var.Private_Key_Path} '../../Ansible/Docker.yml'"
}

}


resource "aws_ebs_volume" "My-EBS" {
  availability_zone =  var.myebs_availabilityZone  
  size = var.my-EBS-size

  tags = {
    Name = var.my-EBS-name
  }             
}

resource "aws_volume_attachment" "EBS-attach" {
  device_name = var.volume-path-in-instance-file-sys    # Device name to attach the volume to on the instance
  volume_id   = aws_ebs_volume.My-EBS.id
  instance_id = aws_instance.myEC2instance.id
}
