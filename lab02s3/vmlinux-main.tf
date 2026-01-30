# Naming the resource with a suffix(var.linux_name) to maintain visual grouping in the Azure Portal
resource "azurerm_public_ip" "linux-pip" {
  name                = "${var.linux_name}-pip"
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
  
  # Static allocation ensures the IP address remains the same even if the VM is stopped
  allocation_method   = "Static"

  # DNS Label: Must be globally unique within the specific Azure region
  # Reusing var.linux_name (which contains a unique ID) helps prevent naming conflicts
  # This creates a FQDN for easier SSH/Web access
  domain_name_label   = var.linux_name
}

resource "azurerm_network_interface" "linux-nic" {
  # network-interface-card
  name                = "${var.linux_name}-nic"
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig"
    subnet_id                     = azurerm_subnet.network-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux-pip.id
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = var.linux_name
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
  size                = var.linux_vm_size
  admin_username      = var.linux_admin_username
  network_interface_ids = [
    azurerm_network_interface.linux-nic.id,
  ]

  admin_ssh_key {
    username   = var.linux_admin_username
    # The file() function reads the contents of the file at the given path
    public_key = file(var.linux_public_key_path)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk"
    caching              = var.linux_disk_caching
    storage_account_type = var.linux_storage_account_type
    disk_size_gb         = var.linux_disk_size
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }
}