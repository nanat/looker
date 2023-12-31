connection: "sales"

include: "/views/sales_info.view"
include: "/views/superstore_sales.view"
include: "/views/customer_lifetime_value.view"
include: "/views/best_customers.view"

include: "/views/uk_population_by_age.view"
include: "/views/uk_population_by_year.view"
include: "/views/uk_predicted_population.view"
include: "/views/wellbeing.view"
include: "/views/income_after_housing_cost.view"
include: "/views/weekly_expenditures.view"
include: "/views/eng_wal_general_health.view"
include: "/views/eng_wal_disability_impact_on_daily_activities.view"
include: "/views/eng_wal_residency_type.view"
include: "/views/eng_wal_older_living_alone.view"
include: "/views/workforce_age.view"

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

explore: aging_population {
  from: uk_population_by_age
}

explore: population_by_year {
  from: uk_population_by_year
}

explore: predicted_population {
  from: uk_predicted_population
}

explore: wellbeing {
  from: wellbeing
}

explore: eng_wal_general_health {
  from: eng_wal_general_health
}

explore: eng_wal_disability_impact_on_daily_activities {
  from: eng_wal_disability_impact_on_daily_activities
}

explore: eng_wal_residency {
  from: eng_wal_residency_type
}

explore: eng_wal_older_living_alone {
  from: eng_wal_older_living_alone
}

explore: workforce_age {
  from: workforce_age
}

explore: income {
  from: income_after_housing_cost
}

explore: expenditures {
  from: weekly_expenditures
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
