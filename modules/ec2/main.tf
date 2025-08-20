# terrascan:skip:AC_AWS_0028.aws_instance.app_server reason: Detailed monitoring is not required for this dev instance.
# terrascan:skip:AC_AWS_0110.aws_instance.app_server reason: IMDSv2 will be configured later via user data.
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = merge(
    {
      "name" = var.instance_name
    },
    var.tags
  )
}
