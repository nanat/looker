view: eng_wal_disability_impact_on_daily_activities {
  sql_table_name: `api-project-465858738704.uk_population.eng_wal_disability_impact_on_daily_activities` ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: limited_a_little {
    type: number
    sql: ${TABLE}.limited_a_little ;;
  }
  dimension: limited_a_lot {
    type: number
    sql: ${TABLE}.limited_a_lot ;;
  }
  dimension: not_limited {
    type: number
    sql: ${TABLE}.not_limited ;;
  }
  measure: limited_a_little_m {
    type: average
    sql: ${limited_a_little} ;;
  }
  measure: limited_a_lot_m {
    type: average
    sql: ${limited_a_lot} ;;
  }
  measure: not_limited_m {
    type: average
    sql: ${not_limited} ;;
  }
}
