#lambda function creation

resource "aws_lambda_function" "instance_onoff_function" {
  function_name    = "instance_onoff_function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "startstop.lambda_handler"
  runtime          = "python3.8"
  timeout          = 60

  filename         = "startstop.py.zip"  # Replace with the name of your deployment package

  source_code_hash = filebase64sha256("startstop.py.zip")  # Replace with the name of your deployment package
}
