variable "credentials" {
    type = string
}

variable "project_id" {
    type = string
}

variable "region" {
    type = string
}

variable "playground" {
    type = string
}

variable "zones" {
    type = list(string)
}

variable "vpc_network" {
    type = string
}

variable "subnetwork" {
    type = string
}

variable "node_pool_name" {
    type = string
}

variable "service_account" {
    type = string
}

variable "cluster_name" {
    type = string
}

variable "node_pool_machine_type" {
    type = string
}