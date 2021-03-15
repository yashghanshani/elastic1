variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAUMUNIZJOXDYA7R6V"
}
variable "AWS_SECRET_KEY" {
    type = string
    default = "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"
}
 variable "vpd_id" {
     type = string
    description = "VPC id"
    default = "vpc-a95edec2"
}

variable "PrivateSubnet1" {
    type = string
  default = "subnet-872088ec"
}

variable "PrivateSubnet2" {
    type = string
  default = "subnet-8fad4cf2"
}

variable "PublicSubnet1" {
    type = string
  default = "subnet-070f396d6d45f479e"
}

variable "PublicSubnet2" {
    type = string
  default = "subnet-0e607034f89f4dcfa"
}

variable "extended_ec2_policy_document" {
  type        = string
  default     = "{}"
  description = "Extensions or overrides for the IAM role assigned to EC2 instances"
}

variable "prefer_legacy_ssm_policy" {
  type        = bool
  default     = true
  description = "Whether to use AmazonEC2RoleforSSM (will soon be deprecated) or AmazonSSMManagedInstanceCore policy"
}
variable "autoscale_min" {
  type        = number
  default     = 2
  description = "Minumum instances to launch"
}

variable "autoscale_max" {
  type        = number
  default     = 3
  description = "Maximum instances to launch"
}

variable "allowed_security_groups" {
  type        = list(string)
  description = "List of security groups to add to the EC2 instances"
  default     = []
}

variable "additional_security_groups" {
  type        = list(string)
  description = "List of security groups to be allowed to connect to the EC2 instances"
  default     = []
}

variable "enhanced_reporting_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"
}