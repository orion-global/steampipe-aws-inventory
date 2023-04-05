#---------------------------------------------------------------------------------------------------------
# Dashboard: ec2_inventory_dashboard
#---------------------------------------------------------------------------------------------------------

dashboard "ec2_instance_dashboard" {

  title         = "Inventario de instancias (EC2)"
  documentation = file("./dashboards/ec2/docs/ec2_inventory_dashboard.md")

  tags = merge(local.ec2_common_tags, {
    type = "Inventory"
  })

  input "instance_arn" {
    title = "Selecciona una cuenta: "
    query = query.ec2_instance_input
    width = 4
  }

  # Indicadores
  container {
    card {
      query = query.ec2_instance_count
      width = 2
      args  = [self.input.instance_arn.value]
    }
  }

  # Resumen
  container {
    table {
      query = query.ec2_instance_type_count
      width = 3
      args  = [self.input.instance_arn.value]
    }

    table {
      query = query.ec2_instance_region_count
      width = 3
      args  = [self.input.instance_arn.value]
    }

    table {
      query = query.ec2_instance_subnet_count
      width = 3
      args  = [self.input.instance_arn.value]
    }
  }


  # Detalles
  container {
    title = "Detalles"

    table {
      query = query.ec2_instance_details
      width = 12
      args  = [self.input.instance_arn.value]
    }
  }

}

#---------------------------------------------------------------------------------------------------------
# Queries
#---------------------------------------------------------------------------------------------------------

# Input
query "ec2_instance_input" {
  sql = <<-EOQ
    select 
      title as label,
      account_id as value
    from 
      aws_account
  EOQ
}

# Indicadores
query "ec2_instance_count" {
  sql = <<-EOQ
    select count(*) as "Instancias" from aws_ec2_instance where account_id = $1
  EOQ
}

# Resumen
query "ec2_instance_type_count" {
  sql = <<-EOQ
    select  
      instance_type, 
      count(*) 
    from 
      aws_ec2_instance
    where 
      account_id = $1
    group by 
      instance_type
  EOQ
}

query "ec2_instance_region_count" {
  sql = <<-EOQ
    select  
      region, 
      count(*) 
    from 
      aws_ec2_instance
    where 
      account_id = $1
    group by 
      region
  EOQ
}

query "ec2_instance_subnet_count" {
  sql = <<-EOQ
    select  
      subnet_id, 
      count(*) 
    from 
      aws_ec2_instance
    where 
      account_id = $1
    group by 
      subnet_id
  EOQ
}

# Detalles
query "ec2_instance_details" {
  sql = <<-EOQ
    select 
      ec2.instance_id as "ID de instancia",
      ec2.instance_type as "Tipo de instancia",
      ec2.instance_state as "Estado de instancia",
      ec2.monitoring_state as "Estado de monitoreo",
      ec2.disable_api_termination as "Terminación de API deshabilitada",
      ec2.architecture as "Arquitectura",
      ec2.ebs_optimized as "EBS Optimizado",
      ec2.hypervisor as "Hipervisor",
      ec2.image_id as "Imagen",
      ec2.key_name as "Clave SSH",
      ec2.launch_time as "Tiempo de lanzamiento",
      ec2.placement_availability_zone as "Zona de disponibilidad",
      ec2.private_ip_address as "IP privada",
      ec2.subnet_id as "Subnet ID",
      ec2.vpc_id as "VPC ID",
      ec2.region as "Región",
      acc.title as "Cuenta AWS"
    from 
      aws_ec2_instance as ec2
      join aws_account as acc on ec2.account_id = acc.account_id
    where 
      acc.account_id = $1
  EOQ
}
