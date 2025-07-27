# Project Variables - Resource group and all other resources 
variable "project_name" {
  description = "The name of the project, which will be used for all resources"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created.."
  type        = string
}