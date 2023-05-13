variable "policy" {
  description = "Name of policies to be created alongwith json file that contains policy document"
  type        = map(any)
  default     = {}
}

variable "role" {
  description = "Name of roles to be created alongwith json file that contains trust relationship details of the role"
  type        = map(any)
  default     = {}
}
variable "role_policy" {
  description = "Policies to be attached to IAM roles."
  type        = map(any)
  default     = {}
}
