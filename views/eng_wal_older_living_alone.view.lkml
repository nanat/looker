view: eng_wal_older_living_alone {
  sql_table_name: `api-project-465858738704.uk_population.eng_wal_older_living_alone` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: living_alone {
    type: number
    sql: ${TABLE}.living_alone_percent ;;
  }
  measure: living_alone_percent {
    type: average
    sql: ${living_alone} ;;
  }
}
