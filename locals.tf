locals {
  roles_association_policy_list = var.role_policy == {} ? [] : flatten([
    for role in keys(var.role_policy) : [
      for policy in var.role_policy[role] : {
        role   = role
        policy = policy
      }
    ]
  ])

  aws_managed_policies = toset(concat([for role in local.roles_association_policy_list : role.policy if contains(keys(var.policy), role.policy) == false]))
}
