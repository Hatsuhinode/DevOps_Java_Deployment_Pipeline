# **DevOps Java Deployment Pipeline**

## 📖 **Overview**
This project implements a robust **DevOps Pipeline** designed for deploying Java-based applications. The pipeline combines **Terraform**, **Ansible**, **Docker**, and **Jenkins** to automate infrastructure provisioning, environment configuration, application containerization, and CI/CD workflows.

It showcases a complete end-to-end implementation that accelerates deployment processes while ensuring reliability and scalability.

---

## 📂 **Repository Structure**

```plaintext
DevOps_Java_Deployment_Pipeline/
├── Ansible/
│   ├── Docker.yml
│   ├── Jenkins.yml
│   ├── Java.yml
│   ├── ansible.cfg
├── Application/
│   ├── server/
│   │   └── src/
│   ├── webapp/
│       └── src/
├── Terraform/
│   ├── EC2/
│   │   ├── terraform.tfstate.d/
│   │   │   └── development_ws/
│   │   │       └── development.tfvars
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│   ├── Modules/
│       └── ec2_instance/
│           ├── main.tf
│           ├── provider.tf
│           ├── variables.tf
```


---


## 🚀 **Capabilities**

### **1. Infrastructure Automation**
- **Terraform** provisions all AWS resources:
  - VPCs, subnets, security groups, EC2 instances, and EBS volumes.
  - Modularized configurations for efficient reuse.

### **2. Configuration Management**
- **Ansible** automates the setup of necessary tools and configurations:
  - **Java.yml**: Installs Java runtime environment.
  - **Docker.yml**: Installs and configures Docker for containerization.
  - **Jenkins.yml**: Installs Jenkins for CI/CD orchestration.

### **3. CI/CD Pipeline**
- **Jenkins** drives the CI/CD process:
  - Automates code fetching, testing, container building, and deployments.
- **Docker** ensures consistent application runtime environments.
- **Ansible** handles seamless application deployment to EC2 instances.

### **4. Application Deployment Workflow**
1. **Code Integration**: Jenkins fetches the application code from the repository.
2. **Testing**: Executes automated unit tests (JUnit).
3. **Containerization**: Builds Docker images for application encapsulation.
4. **Deployment**: Uses Ansible to deploy containers to AWS infrastructure.

### **5. Application Components**
- **Frontend**: A web-based registration form that collects user data.
- **Backend**: A Java application tested with JUnit.

---

## 📦 Application Details

### Frontend Example
The frontend includes a registration form for new users:

```html
<form action="action_page.php">
  <div class="container">
    <h1>New user Register for DevOps Learning</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <label for="Name"><b>Enter Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
    ...
  </div>
</form>
```

### Backend Unit Test Example
The backend functionality is validated using JUnit, as shown below:

```java
@Test
public void greetShouldIncludeTheOneBeingGreeted() {
  String someone = "World";
  assertThat(greeter.greet(someone), containsString(someone));
}
```


---

## 🌐 Setup and Usage

### 1. Clone the Repository
```bash
git clone https://github.com/username/DevOps_Java_Deployment_Pipeline.git
cd DevOps_Java_Deployment_Pipeline
```

### 2. Provision Infrastructure with Terraform
```bash
cd Terraform/EC2
terraform init
terraform apply -var-file=terraform.tfvars
```

### 3. Configure EC2 Instances with Ansible
```bash
cd Ansible
ansible-playbook -i <EC2-public-IP>, --private-key <path-to-private-key> Java.yml
ansible-playbook -i <EC2-public-IP>, --private-key <path-to-private-key> Docker.yml
ansible-playbook -i <EC2-public-IP>, --private-key <path-to-private-key> Jenkins.yml
```


### 4. Run the CI/CD Pipeline

- Access the Jenkins interface at http://`<EC2-public-IP>`:8080.

- Trigger the pipeline to initiate the build, test, and deployment process.


---

## 📊 Future Enhancements
- Implement microservices architecture to modularize the application further.
- Add monitoring capabilities with Prometheus and Grafana.
- Leverage Kubernetes for advanced container orchestration.