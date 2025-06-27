variable "yc_token" {
  description = "OAuth-токен"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  type        = string
  sensitive   = true
}

variable "yc_folder_id" {
  type        = string
  sensitive   = true
}

variable "yc_zone" {
  description = "зона доступности"
  type        = string
  sensitive   = true
}

variable "yc_service_account_id" {
  type        = string
  sensitive   = true
}

variable "vm_login" {
  description = "логин для подключения к ВМ"
  type        = string
  sensitive   = true
}

variable "ssh_pub_key_path" {
  type        = string
  sensitive   = true
}

variable "db_name" {
  type        = string
  sensitive   = true
}

variable "db_user" {
  type        = string
  sensitive   = true
}

variable "db_password" {
  type        = string
  sensitive   = true
}

variable "tls_fullchain_pem_path" {
  type        = string
  sensitive   = true
}

variable "tls_privkey_pem_path" {
  type        = string
  sensitive   = true
}