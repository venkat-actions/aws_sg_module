resource "aws_security_group" "main" {
  name        = local.common_name
  description = "Allow traffic for ${var.sg_name} project ${var.project} in ${var.environment}"
  vpc_id      = var.vpc_id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # prefix_list_ids = [aws_vpc_endpoint.my_endpoint.prefix_list_id]
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
      Name = "${local.common_name}"
    }
  )
}