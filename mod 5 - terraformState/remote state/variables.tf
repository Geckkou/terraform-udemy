variable "location" {
  description = "this varible indicate the region of the resources"
  type = string
  default = "Brazil South"
}

variable "account_tier" {
  description = "Tier of storage account in azure"
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  description = "type of replication datas of storage account"
  type = string
  default = "LRS"
}