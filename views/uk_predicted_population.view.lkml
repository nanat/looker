view: uk_predicted_population {
  sql_table_name: `api-project-465858738704.uk_population.uk_predicted_population` ;;

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: age_0_4 {
    type: number
    sql: ${TABLE}.age_0_4 ;;
  }
  dimension: age_5_14 {
    type: number
    sql: ${TABLE}.age_5_14 ;;
  }
  dimension: age_15_64 {
    type: number
    sql: ${TABLE}.age_15_64 ;;
  }
  dimension: age_65_69 {
    type: number
    sql: ${TABLE}.age_65_69 ;;
  }
  dimension: age_70_74 {
    type: number
    sql: ${TABLE}.age_70_74 ;;
  }
  dimension: age_75_79 {
    type: number
    sql: ${TABLE}.age_75_79 ;;
  }
  dimension: age_80_84 {
    type: number
    sql: ${TABLE}.age_80_84 ;;
  }
  dimension: age_85_89 {
    type: number
    sql: ${TABLE}.age_85_89 ;;
  }
  dimension: age_90_94 {
    type: number
    sql: ${TABLE}.age_90_94 ;;
  }
  dimension: age_95_99 {
    type: number
    sql: ${TABLE}.age_95_99 ;;
  }
  dimension: age_100_plus {
    type: number
    sql: ${TABLE}.age_100_plus ;;
  }
  measure: infants {
    type:  sum
    sql: ${age_0_4} ;;
  }
  measure: school_age {
    type:  sum
    sql: ${age_5_14} ;;
  }
  measure: work_age {
    type:  sum
    sql: ${age_15_64} ;;
  }
  measure: retirement_age {
    type:  sum
    sql: ${age_65_69} + ${age_70_74} + ${age_75_79} + ${age_80_84} + ${age_85_89} + ${age_90_94} + ${age_95_99} + ${age_100_plus} ;;
  }
  measure: total {
    type:  number
    sql: ${infants} + ${school_age} + ${work_age} + ${retirement_age}  ;;
  }
  measure: infants_percent {
    type:  number
    sql: ${infants} * 100 / ${total} ;;
  }
  measure: school_percent {
    type:  number
    sql: ${school_age} * 100 / ${total} ;;
  }
  measure: work_age_percent {
    type:  number
    sql: ${work_age} * 100 / ${total} ;;
  }
  measure: retirement_age_percent {
    type:  number
    sql: ${retirement_age} * 100 / ${total} ;;
  }
}
