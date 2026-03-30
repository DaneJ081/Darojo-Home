output "swa_deployment_token" {
  value     = azurerm_static_web_app.home.api_key
  sensitive = true
}

resource "azurerm_static_web_app" "home" {
  name                = "${var.application}${var.env}swa"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.application}-${var.env}-rg"
  location = var.location
}
/*
resource "azurerm_storage_account" "sa" {
  name                     = "${var.application}${var.env}sa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  

  tags = {
    environment = var.env
    application = var.application
  }
}

resource "azurerm_storage_blob" "homepage" {
  name                   = "home.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../home.html"
  content_type           = "text/html"
}

resource "azurerm_storage_blob" "favicon" {
  name                   = "favicon.svg"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "../favicon.svg"
  content_type           = "image/svg+xml"
}

resource "azurerm_storage_account_static_website" "home" {
  storage_account_id = azurerm_storage_account.sa.id
  index_document     = "home.html"
}

*/
