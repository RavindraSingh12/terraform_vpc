#!/bin/bash
echo "WARNING: Run this script only once \n \n"
echo "We need workspaces so that infras for different environments can be kept in separate states and terraform doesn't overwrite the infra \n"
echo "By configuring remote backend we are making sure that these workspaces are available globally as in upper env too. \n"

read -p "Enter AWS profile name: " AWS_PROFILE

read -p "In below step we are configuring aws cli profile with aws programmatic user, Please create one if not present with relevent access!! Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1


aws configure --profile $AWS_PROFILE


AWS_PROFILE=$AWS_PROFILE  terraform init

read -p "Enter workspaces separated by space: " WORKSPACES

read -p "Confirm workspaces entered by you ${WORKSPACES[@]}:" confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

for workspace in ${WORKSPACES[@]}
    do
        AWS_PROFILE=$AWS_PROFILE terraform workspace new $workspace
    done


