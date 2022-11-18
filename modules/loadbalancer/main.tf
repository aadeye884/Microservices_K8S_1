# Application Load Balancer
resource "aws_lb" "UST1-alb" {
  name                       = "UST1-alb"
  security_groups            = var.vpc_security_group_ids
  subnets                    = var.subnet_id1
  load_balancer_type         = "application"
}

# Load Balancer Listener
resource "aws_lb_listener" "UST1-alb-listener" {
  load_balancer_arn = aws_lb.UST1-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.UST1-tg.arn
  }
}

# Load Balancer Target Group
resource "aws_lb_target_group" "UST1-tg" {
  name     = "UST1-tg"
  vpc_id   = var.vpc_name
  port     = 30001
  protocol = "HTTP"
    health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    interval            = 30
    timeout             = 5
  }
}

# Worker1 Target group attachment
resource "aws_lb_target_group_attachment" "UST1-tg-att-w1" {
  target_group_arn = aws_lb_target_group.UST1-tg.arn
  target_id        = var.Worker1_node
  port             = 30001
}

# Worker2 Target group attachment
resource "aws_lb_target_group_attachment" "UST1-tg-att-w2" {
  target_group_arn = aws_lb_target_group.UST1-tg.arn
  target_id        = var.Worker2_node
  port             = 30001
}

# Worker3 Target group attachment
resource "aws_lb_target_group_attachment" "UST1-tg-att-w3" {
  target_group_arn = aws_lb_target_group.UST1-tg.arn
  target_id        = var.Worker3_node
  port             = 30001
}