resource "aws_api_gateway_rest_api" "linebot_api" {
  name        = "linebot_api"
  description = "line bot"
}

resource "aws_api_gateway_resource" "linebot" {
  rest_api_id = aws_api_gateway_rest_api.linebot_api.id
  parent_id   = aws_api_gateway_rest_api.linebot_api.root_resource_id
  path_part   = "linebot"
}

resource "aws_api_gateway_method" "linebot" {
  rest_api_id   = aws_api_gateway_rest_api.linebot_api.id
  resource_id   = aws_api_gateway_resource.linebot.id
  http_method   = "POST"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.linebot_authorizer.id
}

resource "aws_api_gateway_integration" "linebot" {
  rest_api_id = aws_api_gateway_rest_api.linebot_api.id
  resource_id = aws_api_gateway_resource.linebot.id
  http_method = aws_api_gateway_method.linebot.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.invoke_arn
}
