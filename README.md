# README #

###   This repo uses  Terraform version = 1.0.2 and support 0.14 and above.

## What is this repository for? ###

* Repo for BigBasket infra.

## Init script for project initialization:

Following script automatically creates aws profile, workspaces required and runs terraform init to download required modules and resources.

Uses: 

* After running the script answer a simple questionaire by typing letter,word choices from list [y,n,Y,N,yes,YES,no,NO]

> bash create_workspace.sh 

#### Inputs: 

Configure aws cli profile

```A named profile is a collection of settings and credentials that you can apply to a AWS CLI command or Terraform cli. When you specify a profile to run a command, the settings and credentials are used to run that command. You can specify one default profile that is used when no profile is explicitly referenced. Other profiles have names that you can specify as a parameter on the command line for individual commands. Alternatively, you can specify a profile in an environment variable (AWS_PROFILE) which essentially overrides the default profile for commands that run in that session.```

> AWS_PROFILE

* List of the workspaces you want to create for ex: dev prod, enter in space separated manner, for ex: bigbasket

> WORKSPACES

## Project structure

```
        .
        ├── README.md
        ├── docs
        ├── live
        │   ├── create_workspace.sh
        │   ├── infra
        │   │   ├── backend.tf
        │   │   ├── main.tf
        │   │   ├── modules
        │   │   │   ├── localmodules
        │   │   │   
        │   │   ├── output.tf
        │   │   ├── providers.tf
        │   │   ├── variables.tf
        │   │   └── versions.tf
        
```
## Local Modules

Create local modules in case you don't find any ligit module in terraform offcial docs for the services you want to deploy
* None 


## Third party modules

* [VPC] (https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)


## Using this terraform repo for vpc deployment

Steps for deploying to various application environments, in our case dev,prod are as following.

1.) Deploy VPC for dev

```
    > cd /live/infra

    ### Run only once

    > bash create_workspace.sh

    ### Change workspace

    > AWS_PROFILE=bigbasket terraform workspace select dev

    ### Validates all syntaxes used

    > AWS_PROFILE=bigbasket terraform validate

    ### Deploying with a saved plan

    > AWS_PROFILE=bigbasket terraform plan -var-file=../environments/dev.tfvars -out lower_vpc_plan
    > AWS_PROFILE=bigbasket terraform apply lower_vpc_plan

    ### Deploy without a saved plan

    > AWS_PROFILE=bigbasket terraform apply -var-file=../environments/dev.tfvars

```

2.) Deploy VPC for prod

```
    cd /live/infra

    ### Change workspace

    > AWS_PROFILE=bigbasket terraform workspace select prod

    ### Validates all syntaxes used

    > AWS_PROFILE=bigbasket terraform validate

    ### Deploying from a saved plan

    > AWS_PROFILE=bigbasket terraform plan -var-file=../environments/prod.tfvars -out upper_vpc_plan
    > AWS_PROFILE=bigbasket terraform apply upper_vpc_plan

    ### Deploy without a saved plan

    > AWS_PROFILE=bigbasket terraform apply -var-file=../environments/prod.tfvars

```

## References
    * [VPC] (https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)



## Author 

[Ravindra Singh](https://www.linkedin.com/in/ravindra-singh-aa1b2282/)
