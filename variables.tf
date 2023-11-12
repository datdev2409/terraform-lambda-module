variable "source_file" {
  type = string
}

variable "output_path" {
  type = string
}

variable "function_name" {
  type = string
}

variable "resource_based_policies" {
  description = "List of resource-based policies for lambda function. Used to set permisison for other AWS resource to invoke the function"
  type = list(object({
    statement_id = optional(string, null)
    principal    = string
    source_arn   = optional(string)
  }))
}

variable "exec_inline_policy" {
  type        = string
  description = "Inline policy for lambda execution role in JSON format"
  default     = null
}

variable "exec_managed_policy_arns" {
  type        = list(string)
  description = "List of managed policy ARNs for lambda execution role"
  default     = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

variable "runtime" {
  type    = string
  default = "python3.11"
}

variable "environment_variables" {
  type        = map(string)
  description = "The environment variables that passed to python code"
}
