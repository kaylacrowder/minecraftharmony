resource "aws_cloudwatch_event_rule" "instance_onoff_rule" {
  name                = "instance-onoff-rule"
  description         = "Trigger Lambda function to check an instance every day at 8:00 AM and 11pm and stop or start it"
  schedule_expression = "cron(0 8,23 * * ? *)"  # Replace with your desired schedule

  tags = {
    Name = "instance-start-rule"
  }
}

resource "aws_cloudwatch_event_target" "instance_start_target" {
  rule      = aws_cloudwatch_event_rule.instance_onoff_rule.name
  target_id = "instance-onoff-lambda"

  arn = aws_lambda_function.instance_onoff_function.arn
}
