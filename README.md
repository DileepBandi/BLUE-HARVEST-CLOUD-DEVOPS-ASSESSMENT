![image](https://github.com/user-attachments/assets/dbd95332-dfa6-48be-a790-5673f3f698e3)
![image](https://github.com/user-attachments/assets/79c09ce6-d290-4ab8-b706-6dadf2fb7026)
Step 1: Provisioning the VM/EC2 Instance

Access your preferred cloud provider console.
Provision a VM instance or EC2 instance with the desired specifications (CPU, RAM, storage).
Ensure that the instance has internet connectivity.
Step 2: Installing Jenkins

SSH into the VM/EC2 instance.
Update the system package repository:
sudo apt update
 
Install Jenkins:
yum apt install -y default-jre
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
yum sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
yum update -y
yum install -y Jenkins
After this if your check Jenkins version you will get output like below
 
Start Jenkins service:
systemctl start jenkins
systemctl enable jenkins
 

Access Jenkins Web URL:
Open a web browser and navigate to http://<your_server_ip>:8080
 

Follow the on-screen instructions to complete the Jenkins setup wizard.

Step 3: Installing Required Software

yum install git
yum install docker
yum install jq -y
Terraform:
Follow the official Terraform installation guide: Terraform Installation Guide
AWS CLI:
Follow the official AWS CLI installation guide: AWS CLI Installation Guide
Maven (version 3.6.3):
yum apt install -y maven
OpenJDK (version 11.0.22):
Follow the appropriate installation guide for your operating system:
Ubuntu: OpenJDK Installation Guide
CentOS/RHEL: OpenJDK Installation Guide

Setting up for the Jenkins pipeline
Step 1: Clone Repository

Navigate to the GitHub repository using the following URL: https://github.com/DileepBandi/BLUE-HARVEST-CLOUD-DEVOPS-ASSESSMENT.git
Clone the repository to your Jenkins server environment.
Repository Contents:
Folder Name: terraform
Files:
Dockerfile
Jenkinsfile
 
Step 2: Set Up Jenkins Job

Access your Jenkins server.
Create a new Jenkins job using a pipeline.
In the job configuration:
Check the "This project is parameterized" checkbox.
Add a parameter named "action" with values "apply" and "destroy".
Under pipeline in “pipeline section” select dropdown as pipeline script and keep the data which is in Jenkins pipeline file 

 
 

Save the job configuration.

Step 3: Run Jenkins Pipeline

Navigate to the Jenkins job you created.
Click on "Build with Parameters".
Select the desired action (apply or destroy) and click "Build".
Wait for the pipeline to complete execution.
Step 4: Access the Application
Once the Jenkins pipeline execution is successful, the application will be deployed.
You can now access the application using the provided application URL.

Access Jenkins Web URL:
Open a web browser and navigate to http://<your_server_ip>:8080
 

Follow the on-screen instructions to complete the Jenkins setup wizard.

Step 3: Installing Required Software

yum install git
yum install docker
yum install jq -y
Terraform:
Follow the official Terraform installation guide: Terraform Installation Guide
AWS CLI:
Follow the official AWS CLI installation guide: AWS CLI Installation Guide
Maven (version 3.6.3):
yum apt install -y maven
OpenJDK (version 11.0.22):
Follow the appropriate installation guide for your operating system:
Ubuntu: OpenJDK Installation Guide
CentOS/RHEL: OpenJDK Installation Guide
