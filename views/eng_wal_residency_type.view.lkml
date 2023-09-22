view: eng_wal_residency_type {
  sql_table_name: `api-project-465858738704.uk_population.eng_wal_residency_type` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: private_household {
    type: number
    sql: ${TABLE}.private_household ;;
  }
  dimension: communal_establishment {
    type: number
    sql: ${TABLE}.communal_establishment ;;
  }
  measure: private_household_percent {
    type: average
    sql: ${private_household} ;;
  }
  measure: communal_establishment_percent {
    type: average
    sql: ${communal_establishment} ;;
  }
}
