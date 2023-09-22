view: eng_wal_general_health {
  sql_table_name: `api-project-465858738704.uk_population.eng_wal_general_health` ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: good_health_percent {
    type: number
    sql: ${TABLE}.good_health_percent ;;
  }
  dimension: fair_health_percent {
    type: number
    sql: ${TABLE}.fair_health_percent ;;
  }
  dimension: bad_health_percent {
    type: number
    sql: ${TABLE}.bad_health_percent ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  measure: good_health_avg {
    type: average
    sql:  ${good_health_percent} ;;
  }
  measure: fair_health_avg {
    type: average
    sql:  ${fair_health_percent} ;;
  }
  measure: bad_health_avg {
    type: average
    sql:  ${bad_health_percent} ;;
  }
}
