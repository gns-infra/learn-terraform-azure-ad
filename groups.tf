# ------------------
# DRY / single-source
# ------------------
locals {
  groups = {
    itops = { display_name = "Technology - ITOps",   job_title = "ITOps",      mail_nickname = "itops-team" }
    design = { display_name = "UX - Design",         job_title = "Design",     mail_nickname = "ux-design" }
    frontend = { display_name = "Engineering - Frontend", job_title = "Frontend", mail_nickname = "eng-frontend" }
    legal = { display_name = "Legal - Legal",        job_title = "Legal",      mail_nickname = "legal-team" }
    product = { display_name = "Product - Product",  job_title = "Product",    mail_nickname = "product-team" }
    people_ops = { display_name = "HR - People Ops", job_title = "People Ops", mail_nickname = "people-ops" }
    backend = { display_name = "Engineering - Backend", job_title = "Backend", mail_nickname = "eng-backend" }
    security = { display_name = "InfoSec - Security", job_title = "security", mail_nickname = "info-sec" }
  }
}

# create Microsoft 365 groups (Unified) and make them role-assignable
resource "azuread_group" "groups" {
  for_each = local.groups

  display_name       = each.value.display_name
  mail_enabled       = true
  mail_nickname      = each.value.mail_nickname
  security_enabled   = true
  types              = ["Unified"]
  assignable_to_role = true
}

# build the group -> member map and create members
locals {
  group_members = merge([
    for g_key, g in local.groups : {
      for u_key, u in azuread_user.users :
      "${g_key}:${u_key}" => {
        group_key = g_key
        group_id  = azuread_group.groups[g_key].id
        user_key  = u_key
        user_id   = u.id
      } if u.job_title == g.job_title
    }
  ]...)
}

resource "azuread_group_member" "members" {
  for_each = local.group_members

  group_object_id  = each.value.group_id
  member_object_id = each.value.user_id
}
