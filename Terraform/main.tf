provider "aws" {
  region = "us-west-2"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket         	   = "minecraftharmonybackup"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-west-2"
    encrypt        	   = true
}
}
/*
#import blocks nov 2023
import {
  to = aws_lambda_function.instance_onoff_function
  id = "instance_onoff_function"
}
import {
  to = aws_iam_role_policy_attachment.lambda_policy_attachment_2

  id = "lambda-role/arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
import {
  to = aws_iam_role_policy_attachment.lambda_policy_attachment

  id = "lambda-role/arn:aws:iam::792362287537:policy/ec2-policy"
}
import {
  to = aws_iam_role.lambda_role

  id = "lambda-role"
}
import {
  to = aws_iam_policy.ec2_policy

  id = "arn:aws:iam::792362287537:policy/ec2-policy"
}
import {
  to = aws_cloudwatch_event_rule.instance_onoff_rule
  id = "instance-onoff-rule"
}
import {
  to = aws_cloudwatch_event_target.instance_start_target

  id = "instance_onoff_rule/instance_onoff_lambda"
}*/

