# Tactile Infra Terraform

Terraform allows to maintain information and structure about servers and cloud configuration.
Download and install Terraform binary from [Terraform Website](https://www.terraform.io/downloads).

This project along with the credentials provided to you will allow you to work with Terraform and Kubernetes on Google Cloud Platform.

## Configuration

* Use your firstname and lastname instead of the temporary prefix in `environments/[test/staging/production]/main.tf`

```
prefix  = "john-doe"
```

* Place the `credentials.json` file that you have received with this assignment in `environments/[test/staging/production]/credentials.json`

* Don't change the bucket name or project names defined in `common/main.tf`

## How to use

Init the terraform environment in the specific environments folder. In case of Test environment, Run

```
cd environments/test/
terraform init
```

Run `plan` with a variable `game_to_deploy(the game that you want to deploy)` view the changes before applying them.
Each game has a separate terraform module which loads from `modules/games/#{game_name}`

e.g.- If you want to deploy BeeBlast, you can run
```
terraform plan -var="game_to_deploy=bb"
```

Apply changes if you're happy with the plan.

```
terraform apply -var="game_to_deploy=bb"
```
