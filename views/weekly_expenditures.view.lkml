view: weekly_expenditures {
  sql_table_name: `api-project-465858738704.uk_population.weekly_expenditures` ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: is_household {
    type: yesno
    sql: ${TABLE}.is_household ;;
  }
  dimension: item {
    type: string
    sql: ${TABLE}.item ;;
  }
  dimension: weekly_expenditure {
    type: number
    sql: ${TABLE}.weekly_expenditure ;;
  }
  measure: expense {
    type: max
    sql: ${weekly_expenditure} ;;
  }
}
