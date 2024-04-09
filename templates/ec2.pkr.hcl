packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = formatdate("YYYY-MM-DD", timestamp())
}

source "amazon-ebs" "ubuntu" {
  ami_name              = "${var.AmiNamePrefix}-${local.timestamp}"
  force_delete_snapshot = var.ForceDeleteSnapshot
  force_deregister      = var.ForceDeregister
  instance_type         = var.InstanceType
  region                = var.Region
  ssh_username          = var.SshUsername
  subnet_id             = var.SubnetId
  vpc_id                = var.VpcId

  # Use spot instances only if spot_price is defined
  dynamic "spot_instance" {
    for_each = var.SpotPrice != null ? [1] : []
    content {
      spot_price = var.SpotPrice
    }
  }

  source_ami_filter {
    filters = {
      name                = var.SourceAmiFilterName
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = var.SourceAmiOwners
  }

  launch_block_device_mappings {
    device_name           = "/dev/sda1"
    volume_size           = var.RootVolumeSize
    volume_type           = "gp3"
    delete_on_termination = true
  }

  run_tags = {
    Name = "${var.AmiNamePrefix}-packer-build"
  }

  tags = {
    Name = "${var.AmiNamePrefix}-${local.timestamp}"
  }
}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    script = var.ProvisionScript
  }

  post-processor "manifest" {
    output     = "${var.AmiNamePrefix}.json"
    strip_path = true
  }

  post-processor "shell-local" {
    inline = [
      "echo 'AMI Name: ${var.AmiNamePrefix}-${local.timestamp}'"
    ]
  }
}
