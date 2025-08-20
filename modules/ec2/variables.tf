variable "instance_name" {
  type        = string
  description = "The name of the EC2 instance. Will be used as the 'name' tag"

  validation {
    condition     = length(var.instance_name) > 0 && length(var.instance_name) < 256
    error_message = "The instance_name must be between 1 and 255 characters."
  }
}

variable "ami_id" {
  type        = string
  description = "The ID of the Amazon Machine Image (AMI) to use for the instance"

  validation {
    condition     = can(regex("^ami-([a-f0-9]{8}|[a-f0-9]{17})$", var.ami_id))
    error_message = "The ami_id must be a valid AMI ID format (e.g., ami-0c55b159cbfafe1f0)."
  }
}

variable "instance_type" {
  type        = string
  description = "instance type to use for the EC2 instance"
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small"], var.instance_type)
    error_message = "Must be t3.micro or t3.small."
  }
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to launch the instance into"

  validation {
    condition     = can(regex("^subnet-([a-f0-9]{8}|[a-f0-9]{17})$", var.subnet_id))
    error_message = "The subnet_id must be a valid subnet ID format (e.g., subnet-0123456789abcdef0)."
  }
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with the instance."

  validation {
    condition     = length(var.vpc_security_group_ids) > 0
    error_message = "At least one security group ID must be provided."
  }
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the instance?"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default     = {}
}
