data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../lambda/linebot/workoutWizard"
  output_path = "workoutWizard.zip"
}

resource "aws_lambda_function" "linebot" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = "workoutWizard"
  role          = aws_iam_role.linebot_lambda_role.arn
  handler       = "workoutWizard"

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime = "go1.x"
}
