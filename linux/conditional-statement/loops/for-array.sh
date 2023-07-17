#!/bin/bash

devops_tools=("docker" "kubernetes" "ansible" "terraform" "jenkins")

for tool in "${devops_tools[@]:2}"
do
   echo $tool
done
