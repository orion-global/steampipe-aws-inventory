---
repository: "https://github.com/turbot/steampipe-mod-aws-insights"
---

# AWS Inventory Mod for Steampipe

An AWS dashboarding tool that can be used to view dashboards and reports across all of your AWS accounts focused on inventory and configuration.

## Overview

Dashboards can help answer questions like:

- 

## Getting started

### Installation

Download and install Steampipe (https://steampipe.io/downloads)

Install the AWS plugin with [Steampipe](https://steampipe.io):

```sh
steampipe plugin install aws
```

Clone the repository:

```sh
git clone https://github.com/orion-global/steampipe-aws-inventory.git
cd steampipe-aws-inventory
```

### Usage

Before running any dashboards, it's recommended to generate your AWS credential report:

```sh
aws iam generate-credential-report
```

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser window at https://localhost:9194. From here, you can view dashboards and reports.

### Credentials

This mod uses the credentials configured in the [Steampipe AWS plugin](https://hub.steampipe.io/plugins/turbot/aws).

### Configuration

No extra configuration is required.