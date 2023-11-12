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
  type = list(object({
    statement_id = optional(string, null)
    principal    = string
    source_arn   = optional(string)
  }))
}

variable "exec_inline_policy" {
  type    = string
  default = null
}

variable "exec_managed_policy_arns" {
  type    = list(string)
  default = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

variable "runtime" {
  type    = string
  default = "python3.11"
}

variable "environment_variables" {
  type = map(string)
}
