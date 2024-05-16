module "myEC2instance" {
    source = "../Modules/EC2"

    aws_region = var.aws_region1
#    myvpc_cidr = var.myvpc_cidr1
    myvpc_name = var.myvpc_name1
#    mysubnet_cidr = var.mysubnet_cidr1
#    mysubnet_availabilityZone = var.mysubnet_availabilityZone1
    mysubnet_name = var.mysubnet_name1
#    igw_name = var.igw_name1
#    destination_cidr = var.destination_cidr1
    instanceName = var.instanceName1
    ami_type = var.ami_type1
    ec2Instance_type = var.ec2Instance_type1
    Key_Name = var.Key_Name1 
    Public_Key_Path = var.Public_Key_Path1
    Private_Key_Path = var.Private_Key_Path1
    my-EBS-size = var.my-EBS-size1
    my-EBS-name = var.my-EBS-name1
    volume-path-in-instance-file-sys = var.volume-path-in-instance-file-sys1
    myebs_availabilityZone = var.myebs_availabilityZone1

}
