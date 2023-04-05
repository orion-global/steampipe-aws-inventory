locals {
  rds_common_tags = {
    service = "AWS/RDS"
  }
}

category "rds_ami" {
  title = "rds AMI"
  color = local.compute_color
  href  = "/aws_insights.dashboard.rds_ami_detail?input.ami={{.properties.'Image ID' | @uri}}"
  icon  = "developer_board"
}

category "rds_application_load_balancer" {
  title = "rds Application Load Balancer"
  color = local.networking_color
  href  = "/aws_insights.dashboard.rds_application_load_balancer_detail?input.alb={{.properties.'ARN' | @uri}}"
  icon  = "mediation"
}

category "rds_autoscaling_group" {
  title = "rds Autoscaling Group"
  color = local.compute_color
  icon  = "library_add"
}

category "rds_classic_load_balancer" {
  title = "rds Classic Load Balancer"
  color = local.networking_color
  href  = "/aws_insights.dashboard.rds_classic_load_balancer_detail?input.clb={{.properties.'ARN' | @uri}}"
  icon  = "mediation"
}

category "rds_gateway_load_balancer" {
  title = "rds Gateway Load Balancer"
  color = local.networking_color
  href  = "/aws_insights.dashboard.rds_gateway_load_balancer_detail?input.glb={{.properties.'ARN' | @uri}}"
  icon  = "mediation"
}

category "rds_instance" {
  title = "rds Instance"
  color = local.compute_color
  href  = "/aws_insights.dashboard.rds_instance_detail?input.instance_arn={{.properties.'ARN' | @uri}}"
  icon  = "memory"
}

category "rds_key_pair" {
  title = "rds Key Pair"
  color = local.compute_color
  icon  = "vpn_key"
}

category "rds_launch_configuration" {
  title = "rds Launch Configuration"
  color = local.compute_color
  icon  = "rocket_launch"
}

category "rds_load_balancer_listener" {
  title = "rds Load Balancer Listener"
  color = local.networking_color
  icon  = "hearing"
}

category "rds_network_interface" {
  title = "rds Network Interface"
  color = local.compute_color
  href  = "/aws_insights.dashboard.rds_network_interface_detail?input.network_interface_id={{.properties.'ID' | @uri}}"
  icon  = "settings_input_antenna"
}

category "rds_network_load_balancer" {
  title = "rds Network Load Balancer"
  color = local.networking_color
  href  = "/aws_insights.dashboard.rds_network_load_balancer_detail?input.nlb={{.properties.'ARN' | @uri}}"
  icon  = "mediation"
}

category "rds_target_group" {
  title = "rds Target Group"
  color = local.networking_color
  icon  = "directions"
}

category "rds_transit_gateway" {
  title = "rds Transit Gateway"
  color = local.networking_color
  icon  = "hub"
}
