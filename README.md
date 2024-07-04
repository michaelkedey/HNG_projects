# HNG Projects

## Project 1 - Static Website Deployment

### Project Overview

This project involves deploying a static website onto an AWS EC2 instance using NGINX as the web server. The website includes personal information and links to social profiles. The deployment method is via `Terraform IAC` using `hcl language`

#### Prerequisites

- AWS account
- Terraform installed
- AWS CLI configured with appropriate credentials

#### Project Structure
```plaintext
.
|-- README.md
`-- static_webpage
    `-- src
        |-- webserver
        |   |-- backend.tfvars
        |   |-- format.sh     
        |   |-- main.tf     
        |   |-- modules     
        |   |   |-- nginx   
        |   |   |   |-- nginx.sh
        |   |   |   |-- provider.tf
        |   |   |   |-- variables.tf
        |   |   |   `-- web_server.tf
        |   |   `-- vpc
        |   |       |-- variables.tf
        |   |       `-- vpc.tf
        |   |-- output.tf
        |   |-- providers.tf
        |   |-- terraform.tfstate
        |   `-- terraform.tfstate.backup
        `-- webserver_files
            |-- index.html
            |-- script.js
            `-- styles.css

7 directories, 17 files


```

#### Project Resources
- vpc &subnet
- route table & route table association
- ec2
- igw
- security group

#### How To
- after `terraform apply`, the public ip address of the ec2 is displayed.
- you may need to reconfigure the backend to use local for your `terraform.tfstate` file
- access the website by pasting the public ip of the instance in your browser.
  ```
  http://ec2_public_ip_address
  ```


## Project 2 - 

### Project Overview