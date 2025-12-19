module "res" {
  source      = "../../azurerm_resource_group"
  rg_name     = "vinay-rg1"
  rg_location = "Central India"
}

module "stg" {
  depends_on   = [module.res]
  source       = "../../azurerm_storage_account"
  stg_name     = "vinaystorage202536"
  rg_name      = "vinay-rg1"
  stg_location = "Central India"
  act          = "Standard"
  art          = "LRS"
}

module "vnet" {
  depends_on    = [module.res]
  source        = "../../azurerm_virtual_network"
  vnet_name     = "vnet1"
  vnet_location = "Central India"
  rg_name       = "vinay-rg1"
  vnet_addspace = ["10.0.0.0/16"]
}

module "pip" {
  depends_on   = [module.res]
  source       = "../../azurerm_public_ip"
  pip_name     = "publicIp1"
  pip_rgname   = "vinay-rg1"
  pip_location = "Central India"
  pip_allmet   = "Static"
}
