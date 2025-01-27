resource "time_static" "time" {}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags = merge(
    var.tags,
    {
      CreatedOn = formatdate("DD-MM-YYYY hh:mm", timeadd(time_static.time.id, "1h"))
    }
  )
}
