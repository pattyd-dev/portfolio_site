# Portfolio Website as IaC

Hello! This is the first project that I've developed for public view. Previously, I have made a couple of apps using the AWS console and then later recreated said projects with Terraform. However, these earlier projects did not hide sensitive information within the code and thus could not be uploaded to a public repositiory.

# Project Overview

The idea is that this project can be cloned, a user can look at the variable list, create their own terraform.tfvars, and handle authentication from their dev environment to AWS—and voila! A secured website from scratch hosted on S3 and distributed via CloudFront, secured with a public certificate from ACM.

AWS Services Used:

    S3: For static website hosting.

    ACM: To manage SSL/TLS certificates.

    CloudFront: For global content distribution and security.

    Route 53: For DNS management.

# Future Plans: CI/CD

Right now, updates are managed by updating local code and running terraform apply on the data_stores environment.

Upcoming goals include:

    GitHub Actions: Create an action to take any pushed code (to a private repo, or public if personal info can be sufficiently obfuscated) and deploy it automatically.

    Cache Invalidation: Ensure the GitHub action invalidates the CloudFront cache so changes reflect immediately.

    Efficient Editing: By getting CI/CD running, I'll be able to manually edit the website and see the results of those changes quickly. Since this site will be nothing fancy, simple HTML file updates are all I'll need.