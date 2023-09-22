view: workforce_age {
  sql_table_name: `api-project-465858738704.uk_population.workforce_age` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: percentage_dim {
    type: number
    sql: ${TABLE}.percentage ;;
  }
  measure: percentage {
    type: average
    sql: ${percentage_dim} ;;
  }
}
