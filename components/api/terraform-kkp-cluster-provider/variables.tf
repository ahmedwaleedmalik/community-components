# Example of KKP user cluster terraform variables
variable "api_base_url" {
  description = "KKP base URL"
  type        = string
  default     = "https://mgmt-prod.cp.3ascloud.de/api"
}

variable "api_token" {
  description = "KKP admin token, see https://docs.kubermatic.com/kubermatic/v2.21/architecture/concept/kkp-concepts/service-account/using-service-account/"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.api_token) > 0
    error_message = "The api_token value must be a set, see https://docs.kubermatic.com/kubermatic/v2.21/architecture/concept/kkp-concepts/service-account/using-service-account"
  }
}

variable "common_bash_file_path" {
  description = "Helper file for some bash functions"
  default     = "_common.sh"
}

# example project id = duwqon5jef
variable "project_id" {
  description = "KKP Project Id"
  type        = string
  default     = "TODO_PROJECT_ID"
}

variable "dc" {
  description = "Datacenter name at a Kubermatic Seed"
  type        = string
  default     = "fra-prod"
}

variable "cluster_name" {
  description = "User Cluster Name"
  type        = string
  default     = "test-tf-cluster"
}
variable "cluster_spec_folder" {
  description = "Folder what contains the cluster spec jsons"
  type        = string
  default     = "kubevirt_cluster_example"
}
variable "kubernetes_version" {
  description = "User Cluster Kubernetes Version"
  type        = string
  default     = "1.26.9"
}

variable "credential_preset_name" {
  description = "Preset to use while creating the user cluster"
  type        = string
  default     = "TODO-ADD-PRESET-NAME"
}

variable "cni_plugin" {
  description = "CNI Pluging name: cilium or canal"
  type        = string
  default     = "cilium"
}

variable "cni_version" {
  description = "Version of the CNI Plugin"
  type        = string
  default     = "1.13.8"
}

variable "machine_replica" {
  description = "Replica of initial created Machines"
  type        = number
  default     = 2
}

variable "machine_osp_name" {
  description = "Name of the selected Operating System Profile (OSP) for the machine controller"
  type        = string
  default     = "osp-ubuntu"
}


# CLOUD PROVIDER Specifics
variable "cloud_provider" {
  description = "Defines cloud provider to use: Possible Values in the moment `kubevirt`, `vsphere`"
  type        = string
  default     = "kubevirt"
}

variable "kubevirt_machine_spec" {
  description = "A selection of parameter for a kubevirt machine object specification."
  type        = object({
    cpus                       = number
    memory                     = string
    disk_size                  = string
    os_image_url               = string
    primary_disk_storage_class = string
  })
  default = {
    cpus                       = 2
    memory                     = "8192Mi"
    disk_size                  = "20Gi"
    os_image_url               = "http://TODO.your.image.url/vms/ubuntu-22.04.img"
    primary_disk_storage_class = "TODO_YOUR_STORAGE_CLASS"
  }
}

variable "vsphere_machine_spec" {
  description = "A selection of parameter for the vSphere machine object specification."
  type        = object({
    cpus        = number
    memory      = number
    disk_size   = number
    template_vm = string
  })
  default = {
    cpus        = 2
    memory      = 8192
    disk_size   = 20
    template_vm = "kkp-ubuntu-22.04"
  }
}