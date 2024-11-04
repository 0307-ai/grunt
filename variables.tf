variable "create" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string
  default     = null
}

variable "endpoints" {
  description = "A map of interface and/or gateway endpoints containing their properties and configurations"
  type        = any
  default     = {}
}

### endpoints variable example
  # endpoints = {
  #   dynamodb = {
  #     service         = "dynamodb"
  #     service_type    = "Gateway"
  #     route_table_ids = flatten(["rtb-0171d3654c327282c", "rtb-0eb10f6e68a31b467", "rtb-083f5e2bf57535ca3"])
  #     policy          = data.aws_iam_policy_document.dynamodb_endpoint_policy.json
  #     tags            = { Name = "dynamodb-vpc-endpoint" }
  #   },
  #   ecs = {
  #     service             = "ecs"
  #     private_dns_enabled = true
  #     subnet_ids          = ["subnet-0d0a7e2b154582c6a", "subnet-0599e407afbe1ae13", "subnet-0003617ae6e323a81"]
  #   }
  # }

variable "security_group_ids" {
  description = "Default security group IDs to associate with the VPC endpoints"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Default subnets IDs to associate with the VPC endpoints"
  type        = list(string)
  default     = []
}


variable "environment" {
  description = "Environment name."
  type        = string
}

variable "service_name" {
  description = "name of the service to add in tags"
  type = string
}

variable "launched_by" {
  description = "name of the user who is launching the cluster for adding in tags"
  type = string
}

variable "team_name" {
  description = "name of the team to add in tags"
  type = string
}


variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting VPC endpoint resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Security Group
################################################################################

variable "create_security_group" {
  description = "Determines if a security group is created"
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "Name to use on security group created. Conflicts with `security_group_name_prefix`"
  type        = string
  default     = null
}

variable "security_group_name_prefix" {
  description = "Name prefix to use on security group created. Conflicts with `security_group_name`"
  type        = string
  default     = null
}

variable "security_group_description" {
  description = "Description of the security group created"
  type        = string
  default     = null
}

variable "security_group_rules" {
  description = "Security group rules to add to the security group created"
  type        = any
  default     = {}
}

variable "security_group_tags" {
  description = "A map of additional tags to add to the security group created"
  type        = map(string)
  default     = {}
}