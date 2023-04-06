#---------------------------------------------------------------------------------------------------------
# Dashboard: ec2_inventory_dashboard
#---------------------------------------------------------------------------------------------------------

dashboard "Inventario_EC2" {
container {
  container {
    width = 3
  }
  container {
    width = 6
    image {
        src = "https://i.postimg.cc/0jqVn7mr/logo-dashboard.jpg"
        alt = "Steampipe Logo"
        width = 12
        }
  }
  container {
    width = 3 
  }
}
    text {
        width = 12
        value = "---"
        }

container{
    container{
        width = 4
         card {
         sql  = query.ec2_count.sql
         title = "Total de instancias"
         icon = "heroicons-outline:information-circle"
         type = "info"
    }
    }
      container{
        width = 4
         card {
         sql  = query.ec2_status_running.sql
         title = "Total de instancias encencidas"
         icon  = "heroicons-outline:check-circle"
         type = "ok"
    }
    }
      container{
        width = 4
         card {
         sql  = query.ec2_status_stopped.sql
         type ="alert"
         title = "Total de instancias apagadas"
         icon  = "heroicons-outline:x-circle"
    }
    }  
}
container{
    container{
        width = 12
      table {
        title = "Detalle de EC2"
        width = 12
        sql = query.ec2_details.sql

      }
    }
}

}
  
#---------------------------------------------------------------------------------------------------------
# Queries
#---------------------------------------------------------------------------------------------------------
# Esta sección esta enfocada a los query para no tenerlo todo en un solo lugar
query "ec2_details"{
  sql = <<-EOQ
        select title as "Name_EC2",public_ip_address, private_ip_address, instance_id, instance_state, private_ip_address, instance_type, launch_time
 from
        aws_ec2_instance
        EOQ
}
query "ec2_count"{
  sql = <<-EOQ
  select count(*) as "Instances" 
  from aws_ec2_instance
  EOQ
}
query "ec2_status_running"{
  sql = <<-EOQ
  select count(*) as "Instances" 
  from aws_ec2_instance where instance_state = 'running'
  EOQ
}
query "ec2_status_stopped"{
  sql = <<-EOQ
  select count(*) as "Instances" 
  from aws_ec2_instance where instance_state = 'stopped'
  EOQ
}
