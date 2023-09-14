view: wellbeing {
  sql_table_name: `api-project-465858738704.uk_population.wellbeing` ;;

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
  dimension: loneliness {
    type: number
    sql: ${TABLE}.loneliness ;;
  }
  dimension: anxiety {
    type: number
    sql: ${TABLE}.anxiety ;;
  }
  dimension: happiness {
    type: number
    sql: ${TABLE}.happiness ;;
  }
  dimension: life_satisfaction {
    type: number
    sql: ${TABLE}.life_satisfaction ;;
  }
  dimension: worthwhile {
    type: number
    sql: ${TABLE}.worthwhile ;;
  }
  measure: loneliness_avg {
    type: average
    sql:  ${loneliness} ;;
  }
  measure: anxiety_avg {
    type: average
    sql:  ${anxiety} ;;
  }
  measure: happiness_avg {
    type: average
    sql:  ${happiness} ;;
  }
  measure: life_satisfaction_avg {
    type: average
    sql:  ${life_satisfaction} ;;
  }
  measure: worthwhile_avg {
    type: average
    sql:  ${worthwhile} ;;
  }
}
