resource "aws_cloudwatch_event_rule" "instance_start_rule" {
  name                = "instance-start-rule"
  description         = "Trigger Lambda function to start an instance every day at 8:00 AM"
  schedule_expression = "cron(0 8 * * ? *)"  # Replace with your desired schedule

  tags = {
    Name = "instance-start-rule"
  }
}

resource "aws_cloudwatch_event_target" "instance_start_target" {
  rule      = aws_cloudwatch_event_rule.instance_start_rule.name
  target_id = "instance-start-lambda"

  arn = aws_lambda_function.instance_start_function.arn
}
