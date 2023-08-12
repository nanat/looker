connection: "sales"

include: "/views/sales_info.view"
include: "/views/superstore_sales.view"

datagroup: looker-playground_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker-playground_default_datagroup

explore: sales_info {
  from: sales_info
}

explore: superstore {
  from: superstore_sales
}
