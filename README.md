Web Application Deployment with Docker, AWS ECR, and ECS
This project demonstrates my expertise in containerization, cloud infrastructure, and deployment. The web application is containerized with Docker, stored in AWS Elastic Container Registry (ECR), and deployed in Amazon Elastic Container Service (ECS) using a secure and scalable three-tier architecture.

Key Skills Demonstrated
Containerization: Dockerfile creation, building, and managing containerized applications.
Cloud Deployment: Pushing images to AWS ECR and deploying with ECS.
Networking: Configuring VPC, NAT Gateways, and security groups for secure communication.
Load Balancing: Using ALB for traffic distribution.
Infrastructure Automation: IAM user setup, CLI usage, and route table configuration.
Project Goals
Deploy a containerized web application in a scalable and highly available environment.
Ensure security and cost optimization with private subnets, NAT Gateways, and ALB.
Automate key processes to demonstrate proficiency with DevOps and AWS tools.
Deployment Steps
Step 1: Setting Up GitHub Repository
Install Git and Visual Studio Code.
Create a GitHub account and set up a key pair.
Add the public SSH key to GitHub.
Create a GitHub repository to store the Dockerfile.
Clone the repository to your computer:
bash
Copy code
git clone <repository_ssh_key>
Step 2: Docker Image Creation
Sign up for a Docker Hub account and install Docker Desktop.
Create a Dockerfile to define the container.
Build the Docker image:
bash
Copy code
docker build -t jupiter .
Verify the image:
bash
Copy code
docker image ls
Run the container locally on port 80:
bash
Copy code
docker run -dp 80:80 jupiter-website
Stop the container:
bash
Copy code
docker stop <CONTAINER_ID>
Step 3: Pushing Image to Docker Hub
Create a repository in Docker Hub.
Log in to Docker Hub:
bash
Copy code
docker login -u <username>
Tag and push the image:
bash
Copy code
docker tag jupiter <username>/jupiterwebsite
docker push <username>/jupiterwebsite
Step 4: Configuring AWS Environment
AWS CLI and IAM User
Install the AWS CLI and create an IAM user with programmatic access.
Configure AWS CLI credentials:
bash
Copy code
aws configure
Create ECR Repository
Create an AWS ECR repository:
bash
Copy code
aws ecr create-repository --repository-name jupiter --region us-east-1
Authenticate Docker with ECR:
bash
Copy code
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com
Tag and push the image to ECR:
bash
Copy code
docker tag jupiter <ECR_URI>
docker push <ECR_URI>
Step 5: Creating a Three-Tier Architecture
VPC Setup:
Create a VPC with public and private subnets across 2 Availability Zones (AZs).
Attach an Internet Gateway to the VPC.
NAT Gateways:
Deploy NAT Gateways in public subnets to enable private subnet instances to access the internet.
Route Tables:
Public subnets route through the Internet Gateway.
Private subnets route through the NAT Gateways.
Step 6: Security Configuration
Application Load Balancer (ALB) Security Group:
Allow HTTP (port 80) and HTTPS (port 443) traffic from the internet.
Container Security Group:
Allow HTTP/HTTPS traffic only from the ALB security group.
Step 7: Deploying with ECS
ECS Cluster:
Create an ECS cluster named Jupiter Cluster.
Task Definition:
Define container settings, including the ECR image, resource allocation (CPU, memory), and networking configurations.
ECS Service:
Attach the task definition to the service.
Configure the service to use private subnets and ALB for traffic management.
Step 8: Configuring Domain and SSL
Route 53:
Register a domain name and create DNS records for the ALB.
SSL Certificate:
Request an SSL certificate via AWS Certificate Manager (ACM).
HTTPS Listener:
Attach the SSL certificate to the ALB for secure traffic handling.
Project Architecture Overview
Three-Tier Architecture Components
Public Subnets:
Internet Gateway, NAT Gateway, Application Load Balancer.
Private Subnets:
Host web servers and databases for added security.
Security Groups:
ALB security group for internet access.
Container security group for internal communication.
Key Commands
Build Docker Image:
bash
Copy code
docker build -t jupiter .
Push Image to ECR:
bash
Copy code
docker tag jupiter <ECR_URI>
docker push <ECR_URI>
Create ECR Repository:
bash
Copy code
aws ecr create-repository --repository-name jupiter --region us-east-1
Outcomes
Successfully deployed a containerized web application in AWS.
Demonstrated expertise in:
Docker and container orchestration.
AWS networking, security, and resource management.
Building scalable and secure cloud architectures.
