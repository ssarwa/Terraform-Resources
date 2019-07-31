resource "azurerm_resource_group" "main" {
  name     = "Vizient-CICD-RG"
  location = "westus"
}

resource "azurerm_app_service_plan" "main" {
  name                = "vizientsr-asp"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "vizientsr-appservice"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"

  site_config {
    linux_fx_version = "JAVA 11|SE"
  }
}
