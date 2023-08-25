view: uk_population_by_year {
  sql_table_name: `api-project-465858738704.uk_population.uk_population_by_year` ;;

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }
  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }
}
