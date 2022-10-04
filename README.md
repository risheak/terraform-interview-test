# Tactile Infra Terraform

Terraform allows to maintain information and structure about servers and cloud configuration.
Download and install Terraform binary from [Terraform Website](https://www.terraform.io/downloads).

This project along with the credentials provided to you will allow you to work with Terraform and Kubernetes on Google Cloud Platform.

## Configuration

* Use your firstname and lastname instead of the temporary prefix in `environments/my-game/main.tf`

```
prefix  = "john-doe"
```

* Place the `credentials.json` file that you have received with this assignment in `environments/[test/staging/production]/my-game/credentials.json`

* Don't change the bucket name or project names defined in `common/main.tf`

## How to use

Init the terraform environment in the specific environments folder

```
cd environments/test/my-game/
terraform init
```

Run `plan` to view the changes before applying them.

```
terraform plan
```

Apply changes if you're happy with the plan.

```
terraform apply
```
