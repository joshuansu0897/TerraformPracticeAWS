## public lamda
resource "aws_lambda_permission" "allow_cloudwatch_to_call_lambda_public" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_public.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_two_minutes_rule.arn
}

resource "aws_cloudwatch_event_target" "lambda_schedular_target_public" {
  rule      = aws_cloudwatch_event_rule.every_two_minutes_rule.name
  target_id = "lambda-tf-pulic"
  arn       = aws_lambda_function.lambda_public.arn
}

## private lamda
resource "aws_lambda_permission" "allow_cloudwatch_to_call_lambda_pivate" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_private.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_two_minutes_rule.arn
}

resource "aws_cloudwatch_event_target" "lambda_schedular_target_pivate" {
  rule      = aws_cloudwatch_event_rule.every_two_minutes_rule.name
  target_id = "lambda-tf-private"
  arn       = aws_lambda_function.lambda_private.arn
}

## cloudwatch group
resource "aws_cloudwatch_log_group" "log_group_public" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_public.function_name}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "log_group_private" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_private.function_name}"
  retention_in_days = 14
}

## cloudwatch event rule
resource "aws_cloudwatch_event_rule" "every_two_minutes_rule" {
  name        = "lambda_schedular_rule"
  description = "schedule events for lambda"
  #schedule_expression = "cron(0/2 * * * ? *)"
  schedule_expression = "rate(2 minutes)"
}
