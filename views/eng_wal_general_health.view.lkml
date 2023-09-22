view: eng_wal_general_health {
  sql_table_name: `api-project-465858738704.uk_population.eng_wal_general_health` ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: bad_health_percent {
    type: number
    sql: ${TABLE}.bad_health_percent ;;
  }
  dimension: fair_health_percent {
    type: number
    sql: ${TABLE}.fair_health_percent ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: good_health_percent {
    type: number
    sql: ${TABLE}.good_health_percent ;;
  }
}
