view: wellbeing {
  sql_table_name: `api-project-465858738704.uk_population.wellbeing` ;;

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }
  dimension: anxiety {
    type: number
    sql: ${TABLE}.anxiety ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: happiness {
    type: number
    sql: ${TABLE}.happiness ;;
  }
  dimension: life_satisfaction {
    type: number
    sql: ${TABLE}.life_satisfaction ;;
  }
  dimension: loneliness {
    type: number
    sql: ${TABLE}.loneliness ;;
  }
  dimension: worthwhile {
    type: number
    sql: ${TABLE}.worthwhile ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
