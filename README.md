# Static Website Deployment

## Project Overview

This project involves deploying a static website onto an AWS EC2 instance using NGINX as the web server. The website includes personal information and links to social profiles. The deployment method is via `Terraform IAC` using `hcl language`

## Prerequisites

- AWS account
- Terraform installed
- AWS CLI configured with appropriate credentials

## Project Structure
```plaintext
.
|-- README.md
|-- static_webpage
|                   `-- src
|       |           `-- webserver
|       |   |       `-- backend.tfvars
|       |   |       `-- format.sh
|       |   |       `-- main.tf
|       |   |       `-- modules
|       |   |   |   `-- nginx
|       |   |   |   |-- nginx.sh
|       |   |   |   |-- provider.tf
|       |   |   |   |-- variables.tf
|       |   |   |   |-- web_server.tf
|       |   |   |   `-- webserver_files
|       |   |   |       |-- index.html
|       |   |   |       |-- script.js
|       |   |   |       `-- styles.css
|       |   |   `-- vpc
|       |   |       |-- variables.tf
|       |   |       `-- vpc.tf
|       |   |-- output.tf
|       |   |-- providers.tf
|       |   |-- terraform.tfstate
|       |   `-- terraform.tfstate.backup
|       `-- webserver_files
|           |-- index.html
|           |-- script.js
|           `-- styles.css
`-- terraform.tfstate

8 directories, 21 files

```

## Project Resources
- vpc &subnet
- route table & route table association
- ec2
- igw
- security group
