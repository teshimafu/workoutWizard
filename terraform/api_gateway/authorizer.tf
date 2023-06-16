resource "aws_api_gateway_authorizer" "linebot_authorizer" {
  name           = "linebot_authorizer"
  rest_api_id    = aws_api_gateway_rest_api.linebot_api.id
  authorizer_uri = var.invoke_arn

  identity_source = "method.request.header.X-Line-Signature"
  type            = "TOKEN"
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.linebot_lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.linebot_api.execution_arn}/*/${aws_api_gateway_method.linebot.http_method}${aws_api_gateway_resource.linebot.path}"
}
