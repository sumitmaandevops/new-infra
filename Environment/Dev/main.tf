module "rg" {
  source = "../../Module/azurerm_resource_group"
  resource_group_name = "app-dev-rg"
  location = "central india"
}
module "vnet" {
    depends_on = [ module.rg ]
  source = "../../Module/azurerm_vnet"
  virtual_network_name = "appvnet"
  address_space = ["10.0.0.0/16"]
  location = "central india"
  resource_group_name = "app-dev-rg"
}
module "subnet" {
    depends_on = [ module.vnet ]
  source = "../../Module/azurerm_subnet"
  subnet_name = "appsubnet"
  resource_group_name = "app-dev-rg"
  virtual_network_name = "appvnet"
  address_prefixes = ["10.0.0.0/24"]
}
<<<<<<< HEAD
# module "publicip" {
#     depends_on = [ module.rg ]
#   source = "../../Module/azurerm_publickip"
#   publicip_name = "mypublicip"
#   resource_group_name = "app-dev-rg"
#   location = "central india"
=======
  module "subnetinfra" {
    depends_on = [ module.vnet ]
  source = "../../Module/azurerm_subnet"
  subnet_name = "infrasubnet"
  resource_group_name = "app-dev-rg"
  virtual_network_name = "appvnet"
  address_prefixes = ["10.0.1.0/24"]
}
module "publicip" {
    depends_on = [ module.rg ]
  source = "../../Module/azurerm_publickip"
  publicip_name = "mypublicip"
  resource_group_name = "app-dev-rg"
  location = "central india"
>>>>>>> b561f45 (new subnet added)

# }
# module "vm" {
#     depends_on = [ module.subnet ]
#     source = "../../Module/azurerm_vm"
#   nic_name = "mynic"
#   location = "central india"
#   resource_group_name = "app-dev-rg"
#   virtual_machene_name = "devta"
#   subnet_name = "appsubnet"
#   virtual_network_name = "appvnet"
#   publicip_name = "mypublicip"
#   publisher = "Canonical"
#    offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     image_version = "latest"
# }
# module "bd" {
#     depends_on = [ module.rg ]
#   source = "../../Module/azurerm_DB"
#   sql_server_name = "mysql-ajay-01"
#   resource_group_name = "app-dev-rg"
#   location = "central india"
#   sql_database_name = "mydb"
# }
# module "acr" {
#   source = "../../Module/azurerm_acr"
#   acr_name = "apunkaacr"
#   resource_group_name = "app-dev-rg"
#   location = "central india"

# }
# module "aks" {
#   source = "../../Module/azurerm_aks"
#   acr_name = "apunkaacr"
#   aks_name = "apunkaaks"
#   location = "central india"
#   resource_group_name = "app-dev-rg"
  
# }
