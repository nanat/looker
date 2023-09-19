view: income_after_housing_cost {
  sql_table_name: `api-project-465858738704.uk_population.income_after_housing_cost` ;;

  dimension: age {
    primary_key: yes
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: income_after_housing_cost {
    type: number
    sql: ${TABLE}.income_after_housing_cost ;;
  }
  measure: count {
    type: count
  }
}
