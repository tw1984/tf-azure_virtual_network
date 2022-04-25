variable "address_space" {
  //type        = string
  description = "The CIDR notation for your virtual network resource."
}

variable "dns_servers" {
  //type        = string
  description = "The list of DNS Serveres to configure on your virtual network."
}

variable "use_custom_dns_servers" {
  type        = bool
  description = "Specify whether you intend to use custom dns servers."
}

variable "location" {
  type        = string
  default     = "southcentralus"
  description = "The region to deploy your resources into."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to deploy the virtual network into."
}

variable "vnet_type" {
    type = string
    description = "The type of virtual network, either 'hub' or 'spoke'."

    validation {
      condition = contains(["hub","spoke"], var.vnet_type)
      error_message = "The acceptable values for this variable are 'hub' or 'spoke'."
    }
}

variable "vnetName" {
  type = string
  description = "The name of the vNet if you want to specify the resource name. If you pass no vNet name value, the default of 'vnet-<hub/spoke>-<location>-cidr' will be used."
  default = ""
}


variable "create_subnets" {
  description = "Specify whether you intend to create subnets inside virtual network."
}

variable "subnets" {
  description = "The list of subnets that will be created inside the virtual network resource."
}