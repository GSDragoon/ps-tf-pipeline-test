# outputs.tf contains all Terraform output definitions (https://www.terraform.io/language/values/outputs).

output "vpc_id" {
  value = aws_vpc.instance.id
}
