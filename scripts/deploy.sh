#!/bin/bash

echo "Initializing Terraform"

terraform init

echo "Planning Infrastructure"

terraform plan

echo "Applying Infrastructure"

terraform apply -auto-approve