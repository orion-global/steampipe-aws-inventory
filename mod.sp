mod "aws_inventory" {
  # hub metadata
  title         = "AWS Inventory EC2"
  description   = "Create dashboards and reports for your AWS resources EC2 using Steampipe."
  color         = "#FF9900"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/aws-insights.svg"
  categories    = ["aws", "dashboard", "public cloud", "inventory"]

  opengraph {
    title       = "Steampipe Mod for AWS Inventory EC2"
    description = "Create dashboards and reports for your AWS resources using Steampipe."
    image       = "/images/mods/turbot/aws-insights-social-graphic.png"
  }

  require {
    steampipe = "0.19.3"
    plugin "aws" {
      version = "0.98.0"
    }
  }
}
