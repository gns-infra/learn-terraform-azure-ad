resource "azuread_group" "itops" {
  display_name = "ITOps"
  security_enabled = true
}

resource "azuread_group_member" "itops" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "ITOps" }

  group_object_id  = azuread_group.itops.id
  member_object_id = each.value.id
}

resource "azuread_group" "sre" {
  display_name = "SRE"
  security_enabled = true
}

resource "azuread_group_member" "sre" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "SRE" }

  group_object_id  = azuread_group.sre.id
  member_object_id = each.value.id
}

resource "azuread_group" "security" {
  display_name = "Security"
  security_enabled = true
}

resource "azuread_group_member" "security" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Security" }

  group_object_id  = azuread_group.security.id
  member_object_id = each.value.id
}

resource "azuread_group" "backend" {
  display_name = "Backend"
  security_enabled = true
}

resource "azuread_group_member" "backend" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "Backend" }

  group_object_id  = azuread_group.backend.id
  member_object_id = each.value.id
}

resource "azuread_group" "frontend" {
  display_name = "Frontend"
  security_enabled = true
}

resource "azuread_group_member" "frontend" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Frontend" }

  group_object_id  = azuread_group.frontend.id
  member_object_id = each.value.id
}

resource "azuread_group" "design" {
  display_name = "Design"
  security_enabled = true
}

resource "azuread_group_member" "design" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Design" }

  group_object_id  = azuread_group.design.id
  member_object_id = each.value.id
}

resource "azuread_group" "product" {
  display_name = "Product"
  security_enabled = true
}

resource "azuread_group_member" "product" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Product" }

  group_object_id  = azuread_group.product.id
  member_object_id = each.value.id
}

resource "azuread_group" "people ops" {
  display_name = "People Ops"
  security_enabled = true
}

resource "azuread_group_member" "people ops" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "People Ops" }

  group_object_id  = azuread_group.peopleops.id
  member_object_id = each.value.id
}

resource "azuread_group" "legal" {
  display_name = "Legal"
  security_enabled = true
}

resource "azuread_group_member" "legal" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.job_title == "Legal" }

  group_object_id  = azuread_group.legal.id
  member_object_id = each.value.id
}

