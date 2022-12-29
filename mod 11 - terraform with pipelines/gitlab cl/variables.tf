variable "location" {
  description = "this varible indicate the region of the resources"
  type = string
  default = "Brazil South"
}

variable "aws_pub_key" {
  description = "Public key para VM na AWS"
  type = string
}

variable "azure_pub_key" {
  description = "Public key para VM na Azure"
  type = string
}
