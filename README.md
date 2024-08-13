# Testing ML models accuracy using Infraestructure automation with Terraform

## Objective
In this project, I implemented an infrastructure at AWS using Terraform for automation to check the accuracy of three differente machine learning models with LLC.

The project structure includes the setup of an EMR cluster on AWS, configured to execute distributed Machine Learning tasks. The training stack is designed to be scalable and resilient, leveraging AWS services for resource management and monitoring. Automated deployment and continuous integration are facilitated by infrastructure-as-code scripts and templates, ensuring replicability and consistency of the environment. 

The result is a robust solution for training Machine Learning models that can handle petabyte-scale data challenges, ideal for organizations seeking deep insights from large datasets.

### Main Stacks
- AWS <a href=https://aws.amazon.com/>(https://aws.amazon.com)</a>
- Terraform <a href=https://www.terraform.io/>(https://www.terraform.io)</a>
- Docker <a href=https://www.docker.com/>(https://www.docker.com)</a>
- Python <a href=https://www.python.org/>(https://www.python.org)</a>

### Data Source
The data used in the project were prepared based on the data available at the link below:

- <a href=https://ai.stanford.edu/~amaas/data/sentiment>Movie Sentiments Analysis</a>

## How to run this project?

1. ### Make a fork of this repository
    Create a fork of this repository in your local environment.

2. ### Download the Source Data
    Download the source data that it is available - <a href=https://ai.stanford.edu/~amaas/data/sentiment>here.</a> In the local project folder, create a new folder called 'dados' and upload the source file into.

3. ### Seting the terraform files
    Into the 'IaC' folder, execute the following steps:
    - Edit the config.tf and terraform.tfvars files, and insert your AWS ID where indicated;
    - In the project.py script, add your AWS ID and your AWS keys where indicated;
    - Manually create the S3 bucket named: dsd-p1-terraform-<aws-id> (replace <aws-id> with your AWS ID).

4. ### Runing the automation with Terraform
    Via Terminal, into the project folder, execute the commands below:
```
docker build -t dsd-terraform-image:p1 .
docker run -dit --name dsd-p1 -v ./IaC:/iac dsd-terraform-image:p1 /bin/bash
```
    <b>Please note that your Docker should be opened before the execution.</b>

    After container creation, open the terminal into Docker and execute the following commands:

    - Set your AWS Credentials for your container.
```
aws configure
```

    - Initialize your Terraform container.
```
terraform init
```
```
terraform apply
```

    After the automation runs, you can access the result of the models processing in S3 bucket and check which model used in this pipeline would fit better in this natural language case. After colleting the results for this ML training, you can destroy this infrastructure create. Before that, please make sure that you have downloaded or moved the results needed from this bucket, as it will be terminated.

    - To destroy this inbfrastructure, execute the destroy.
```
terraform destroy
```

## Conclusion

In conclusion, this project leverages the power of Infrastructure as Code (IaC) using Terraform to automate and manage infrastructure deployment. By utilizing Terraform, we ensure consistency, scalability, and version control across different environments, facilitating easier collaboration and reducing the potential for errors. This approach not only streamlines the infrastructure management process but also aligns with best practices in modern cloud architecture, making the infrastructure more resilient and adaptable to change. Feel free to explore the code, contribute, and reach out with any questions or suggestions.