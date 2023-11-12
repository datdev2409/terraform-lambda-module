data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}

resource "aws_lambda_permission" "resource_based_policies" {
  count         = length(var.resource_based_policies)
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  statement_id  = var.resource_based_policies[count.index].statement_id
  principal     = var.resource_based_policies[count.index].principal
  source_arn    = var.resource_based_policies[count.index].source_arn
}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "${var.function_name}_exec_role"
  assume_role_policy = templatefile("${path.module}/policies/lambda_assume_role_policy.json", {})

  inline_policy {
    name   = "${var.function_name}_exec_inline_policy"
    policy = var.exec_inline_policy
  }

  managed_policy_arns = var.exec_managed_policy_arns
}

resource "aws_lambda_function" "lambda_function" {
  filename         = var.output_path
  function_name    = var.function_name
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = local.handler
  source_code_hash = data.archive_file.lambda_code.output_base64sha256
  runtime          = var.runtime
  timeout          = 60
  memory_size      = 128

  environment {
    variables = var.environment_variables
  }
}
