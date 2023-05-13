data "aws_iam_policy" "name" {
  for_each = local.aws_managed_policies
  name     = each.value

  depends_on = [ aws_iam_policy.policy ]
}
