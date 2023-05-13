############IAM POLICY############
resource "aws_iam_policy" "policy" {
  for_each = var.policy
  name     = each.key
  policy   = contains(split(".", each.value), "json") ? file("${path.root}/iam_role_policy/${each.value}") : each.value
}

############IAM ROLE############
resource "aws_iam_role" "role" {
  for_each           = var.role
  name               = each.key
  assume_role_policy = file("${path.root}/iam_assume_role/${each.value}")
}

resource "aws_iam_role_policy_attachment" "policy" {
  for_each   = { for i in local.roles_association_policy_list : "${i["role"]}_${i["policy"]}" => i }
  role       = each.value.role
  policy_arn = contains(keys(var.policy), each.value.policy) ? aws_iam_policy.policy[each.value.policy].arn : data.aws_iam_policy.name[each.value.policy].id
}
