resource "aws_security_group" "main" {
  name        = "local.common_name"
  description = "Allow traffic for ${var.sg_name} project ${var.project} in ${var.environment}"
  vpc_id      = var.vpc_id

  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
      Name = "${local.common_name}-${var.sg_name}"
    }
  )
}