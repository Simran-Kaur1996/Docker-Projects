# Docker-ProjectsWeb Application Deployment with Docker, ECR, and ECS
This project demonstrates the deployment of a web application using Docker, AWS Elastic Container Registry (ECR), and Amazon Elastic Container Service (ECS). The deployment is performed in a secure and scalable three-tier architecture with a custom VPC. Below are the detailed steps, tools, and technologies used in this project.

Project Highlights
Technologies Used: Docker, AWS (ECR, ECS, VPC, Route 53, ALB, NAT Gateway), Terraform, SSL Certificates.
Key Skills Demonstrated:
Docker containerization
AWS cloud infrastructure setup
Secure application deployment
Networking and security with AWS VPC and Security Groups
Load balancing with ALB
Continuous Integration/Continuous Deployment (CI/CD)
Steps to Recreate the Project
1. Setting Up the Environment
Install Git and Visual Studio Code on your computer.
Register for a GitHub account, create an SSH key pair, and add the public key to GitHub.
Create a GitHub repository to store the Dockerfile.
2. Cloning and Building Docker
Clone the GitHub repository to your local system:
bash
Copy code
git clone <repository_ssh_key>
Sign up for a Docker Hub account and install Docker on your computer.
Create a Dockerfile and build a container image:
bash
Copy code
docker build -t jupiter .
Verify the image was created:
bash
Copy code
docker image ls
Run the container locally:
bash
Copy code
docker run -dp 80:80 jupiter-website
Stop the container:
bash
Copy code
docker stop <CONTAINER_ID>
3. Pushing to Docker Hub
Log in to Docker Hub from your terminal:
bash
Copy code
docker login -u <username>
Tag and push the image to Docker Hub:
bash
Copy code
docker push <username>/jupiterwebsite
4. Setting Up AWS Environment
Install the AWS CLI and create an IAM user with programmatic access.
Configure AWS CLI:
bash
Copy code
aws configure
Create an ECR repository:
bash
Copy code
aws ecr create-repository --repository-name jupiter --region us-east-1
Tag and push the image to ECR:
bash
Copy code
docker tag jupiter <ECR_URI>
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ECR_URI>
docker push <ECR_URI>
5. Building a Three-Tier AWS VPC
VPC Setup:
Create a VPC with public and private subnets across 2 Availability Zones (AZs).
Attach an Internet Gateway to the VPC.
NAT Gateway:
Set up NAT Gateways in public subnets to allow private subnet instances to access the internet.
Route Tables:
Associate public subnets with a public route table.
Associate private subnets with NAT Gateway route tables.
6. Configuring Security
Application Load Balancer (ALB) Security Group:
Allow HTTP (port 80) and HTTPS (port 443) traffic from the internet.
Container Security Group:
Allow HTTP/HTTPS traffic from the ALB security group.
7. Deploying with ECS
Create an ECS Cluster and a Task Definition:
Define container settings (image, CPU, memory) and networking configurations.
Launch an ECS service:
Attach private subnets, ALB, and the task definition.
8. Configuring Route 53 and SSL
Register a domain name in Route 53.
Create DNS records for the ALB.
Request an SSL certificate via AWS Certificate Manager (ACM).
Attach the SSL certificate to the ALB for HTTPS traffic.
Three-Tier Architecture
Public Subnet: Contains NAT Gateways and ALB.
Private Subnet: Hosts web servers and database instances for added security.
Commands Reference
Build Docker Image:
bash
Copy code
docker build -t jupiter .
Run Docker Container Locally:
bash
Copy code
docker run -dp 80:80 jupiter-website
Push to ECR:
bash
Copy code
docker tag jupiter <ECR_URI>
docker push <ECR_URI>
Outcomes
Successfully deployed a containerized web application with Docker, AWS ECR, and ECS in a secure and scalable environment.
Demonstrated advanced cloud deployment skills, including networking, security, and automation.
Future Improvements
Automate the entire deployment process using Terraform and CI/CD pipelines.
Integrate monitoring and logging solutions (e.g., CloudWatch, ELK stack).
