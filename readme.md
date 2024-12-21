# React Native Notes App - CI/CD Pipeline

This project sets up a CI/CD pipeline for deploying a React Native Notes App to an AWS EC2 instance, following GitOps principles.

---

## Project Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/saikrishnaputturu/react-native-notes-app.git
   cd react-native-notes-app
   ```
2. Install dependencies:
   ```bash
   npm install
   ```

---

## Pipeline Setup

The CI/CD pipeline is configured using GitHub Actions.

1. Add the necessary secrets in the repository:
   - EC2_HOST: Public IP of the EC2 instance.
   - EC2_USER: SSH user (e.g., `ec2-user`).
   - EC2_KEY: Content of your private key file.

2. The pipeline is triggered automatically when changes are pushed to the `main` branch.

---

## Provisioning AWS VM

1. Install Terraform and configure the AWS CLI.
2. Use the provided Terraform configuration to provision an EC2 instance:
   ```bash
   terraform init
   terraform apply
   ```
3. Note the public IP address of the instance from the output.

---

## Deployment

1. Ensure the EC2 instance is provisioned and accessible.
2. Push code changes to the `main` branch of this repository to trigger the pipeline.
3. The CI/CD pipeline will:
   - Build and test the application.
   - Deploy the application to the EC2 instance.

---

## Testing

1. Access the application in a browser at:
   ```
   http://<ec2_public_ip>:<port>
   ```
   Replace `<ec2_public_ip>` with the actual public IP of your EC2 instance and `<port>` with the appropriate port number.

---

## Infrastructure Details

### AWS EC2 Instance
- AMI: Amazon Linux 2
- Instance Type: t2.micro

### Dependencies Installed
- Node.js
- Git

---

## CI/CD Pipeline Details

The pipeline performs the following steps:
1. Build: Installs dependencies and builds the application.
2. Test: Runs application tests.
3. Deploy: Connects to the EC2 instance, pulls the latest code, installs dependencies, and starts the application.

---

## Notes

- Any configuration changes or infrastructure updates must be tracked in version control.
- Ensure your private key for accessing the EC2 instance is secure and added to the GitHub Secrets.

---

## Submission

1. Push all changes to your forked repository.
2. Share the repository link with the interviewer. Include any necessary credentials for testing (e.g., `terraform.tfvars`, CloudFormation template, or provisioning instructions).
