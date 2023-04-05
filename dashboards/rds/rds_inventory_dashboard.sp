dashboard "rds_instance_dashboard" {

  title         = "Inventario de instancias (EC2)"
  documentation = file("./dashboards/rds/docs/rds_inventory_dashboard.md")

  tags = merge(local.rds_common_tags, {
    type = "Dashboard"
  })

  container {
    card {
      query = query.rds_instance_count
      width = 2
    }
  }

  container {
    title = "Detalles"


    table {
      query = query.rds_instance_details
      width = 6
    }
  }

}

# Card Queries

query "rds_instance_count" {
  sql = <<-EOQ
    select count(*) as "Instancias" from aws_rds_instance
  EOQ
}

query "rds_instance_details" {
  sql = <<-EOQ
    select 
      db_instance_identifier as "ID de instancia", 
      db_cluster_identifier as "ID de Cluster", 
      account_id as "ID de Cuenta AWS" 
    from 
      aws_rds_db_instance
  EOQ
}
