data "external" "self_ip" {
  program = ["/bin/bash", "${path.module}/scripts/self_ip.sh"]
}

resource "aws_security_group_rule" "frontend_egress" {
  description       = "Frontend Instance egress rule"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_instance.sg_id
}

resource "aws_security_group_rule" "frontend_ingress" {
  description       = "Frontend Instance egress rule"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_instance.sg_id
}

resource "aws_security_group_rule" "frontend_ingress_ssh" {
  description       = "Frontend Instance SSH egress rule"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [format("%s/%s", data.external.self_ip.result["internet_ip"], 32)]
  security_group_id = module.frontend_instance.sg_id
}

resource "aws_security_group_rule" "backend_egress" {
  description       = "Backend Instance egress rule"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.backend_instance.sg_id
}

resource "aws_security_group_rule" "backend_ingress" {
  description       = "Backend Instance Ingress rule"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  source_security_group_id = module.frontend_instance.sg_id
  security_group_id = module.backend_instance.sg_id
}

resource "aws_security_group_rule" "backend_ingress_ssh" {
  description       = "backend Instance SSH Ingress rule"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [format("%s/%s", data.external.self_ip.result["internet_ip"], 32)]
  security_group_id = module.backend_instance.sg_id
}
