resource "aws_lambda_function" "lambda_public" {
  filename         = "${path.module}/src/lambda_function.zip"
  function_name    = var.function_name_public
  role             = aws_iam_role.iam_for_lambda_public.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "nodejs12.x"

  environment {
    variables = {
      ELB_ENDPOINT = var.public_elb_endpoint
    }
  }
}

resource "aws_lambda_function" "lambda_private" {
  filename         = "${path.module}/src/lambda_function.zip"
  function_name    = var.function_name_private
  role             = aws_iam_role.iam_for_lambda_private.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "nodejs12.x"

  vpc_config {
    subnet_ids         = var.private_subnets.*.id
    security_group_ids = ["${var.private_sg_id}"]
  }

  environment {
    variables = {
      ELB_ENDPOINT = var.private_elb_endpoint
    }
  }
}
