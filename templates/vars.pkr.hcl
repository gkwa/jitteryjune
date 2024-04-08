variable "VpcId" {
  type    = string
  default = "{{ .VpcId }}"
}

variable "SubnetId" {
  type    = string
  default = "{{ .SubnetId }}"
}

variable "AmiNamePrefix" {
  type    = string
  default = "{{ .AmiNamePrefix }}"
}

variable "SourceAmiFilterName" {
  type    = string
  default = "{{ .SourceAmiFilterName }}"
}

variable "SourceAmiOwners" {
  type    = list(string)
  default = ["099720109477"]
}

variable "SshUsername" {
  type    = string
  default = "ubuntu"
}

variable "InstanceType" {
  type    = string
  default = "t2.small"
}

variable "ProvisionScript" {
  type    = string
  default = "{{ .ProvisionScript }}"
}

variable "Region" {
  type    = string
  default = "{{ .Region }}"
}

variable "SpotPrice" {
  type    = string
  default = "{{ .SpotPrice }}"
}

variable "ForceDeregister" {
  type    = bool
  default = {{ .ForceDeregister }}
}

variable "ForceDeleteSnapshot" {
  type    = bool
  default = {{ .ForceDeleteSnapshot }}
}

variable "RootVolumeSize" {
  type    = number
  default = {{ .RootVolumeSize }}
}
