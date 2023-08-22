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

test: sample_test {
  explore_source: superstore {
    column: customer_name {
      field: superstore.customer_name
    }
    filters: [superstore.order_date: "2014"]
  }
  assert: customer_name_defined {
    expression: NOT is_null(${superstore.customer_name});;
  }
}

# test: order_id_is_unique {
#   explore_source: superstore {
#     column: order_id {}
#     column: number_of_orders {}
#     sorts: [superstore.number_of_orders: desc]
#     limit: 1
#   }
#   assert: order_id_is_unique {
#     expression: ${superstore.number_of_orders} = 1 ;;
#   }
# }
