module "lambda" {
  source = "./lambda"
}

module "api_gateway" {
  source                       = "./api_gateway"
  invoke_arn                   = module.lambda.lambda_invoke_arn
  linebot_lambda_function_name = module.lambda.linebot_lambda_function_name
}
