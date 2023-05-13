output "role_arn" {
  value = {
    for role, role_arn in aws_iam_role.role :
    role => role_arn.arn
  }
}
