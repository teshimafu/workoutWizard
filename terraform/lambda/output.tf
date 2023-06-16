output "lambda_invoke_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.linebot.invoke_arn
}

output "linebot_lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.linebot.function_name
}
