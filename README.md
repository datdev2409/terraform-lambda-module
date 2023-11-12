## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.0  |

## Resources

| Name                                                                                                                                           | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_role.lambda_exec_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                          | resource    |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)             | resource    |
| [aws_lambda_permission.resource_based_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource    |
| [archive_file.lambda_code](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file)                            | data source |

## Inputs

| Name                                                                                                      | Description                                                                                                               | Type                                                                                                                                | Default                                                                                  | Required |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | :------: |
| <a name="input_environment_variables"></a> [environment_variables](#input_environment_variables)          | The environment variables that passed to python code                                                                      | `map(string)`                                                                                                                       | n/a                                                                                      |   yes    |
| <a name="input_exec_inline_policy"></a> [exec_inline_policy](#input_exec_inline_policy)                   | Inline policy for lambda execution role in JSON format                                                                    | `string`                                                                                                                            | `null`                                                                                   |    no    |
| <a name="input_exec_managed_policy_arns"></a> [exec_managed_policy_arns](#input_exec_managed_policy_arns) | List of managed policy ARNs for lambda execution role                                                                     | `list(string)`                                                                                                                      | <pre>[<br> "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"<br>]</pre> |    no    |
| <a name="input_function_name"></a> [function_name](#input_function_name)                                  | n/a                                                                                                                       | `string`                                                                                                                            | n/a                                                                                      |   yes    |
| <a name="input_output_path"></a> [output_path](#input_output_path)                                        | n/a                                                                                                                       | `string`                                                                                                                            | n/a                                                                                      |   yes    |
| <a name="input_resource_based_policies"></a> [resource_based_policies](#input_resource_based_policies)    | List of resource-based policies for lambda function. Used to set permisison for other AWS resource to invoke the function | <pre>list(object({<br> statement_id = optional(string, null)<br> principal = string<br> source_arn = optional(string)<br> }))</pre> | n/a                                                                                      |   yes    |
| <a name="input_runtime"></a> [runtime](#input_runtime)                                                    | n/a                                                                                                                       | `string`                                                                                                                            | `"python3.11"`                                                                           |    no    |
| <a name="input_source_file"></a> [source_file](#input_source_file)                                        | n/a                                                                                                                       | `string`                                                                                                                            | n/a                                                                                      |   yes    |

## Outputs

| Name                                                                                         | Description |
| -------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_lambda_function_arn"></a> [lambda_function_arn](#output_lambda_function_arn) | n/a         |
