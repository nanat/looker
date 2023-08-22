connection: "sales"

include: "/views/sales_info.view"
include: "/views/superstore_sales.view"
include: "/views/customer_lifetime_value.view"
include: "/views/best_customers.view"

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

  join: best_customers {
    type: inner
    relationship: many_to_one
    sql_on: ${superstore.customer_name} = ${best_customers.customer_name} ;;
  }
}

explore: customer_lifetime_value {
  from: customer_lifetime_value
}
