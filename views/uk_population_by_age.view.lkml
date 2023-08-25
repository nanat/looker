view: uk_population_by_age {
  sql_table_name: `api-project-465858738704.uk_population.uk_population_by_age` ;;

  dimension: area_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.area_code ;;
  }
  dimension: area_name {
    type: string
    sql: ${TABLE}.area_name ;;
  }
  dimension: age_0_4 {
    type: number
    sql: ${TABLE}.age_0_4 ;;
  }
  dimension: age_5_15 {
    type: number
    sql: ${TABLE}.age_5_15 ;;
  }
  dimension: age_16_64 {
    type: number
    sql: ${TABLE}.age_16_64 ;;
  }
  dimension: age_65_70 {
    type: number
    sql: ${TABLE}.age_65_70 ;;
  }
  dimension: age_71_85 {
    type: number
    sql: ${TABLE}.age_71_85 ;;
  }
  dimension: age_86_and_above {
    type: number
    sql: ${TABLE}.age_86_and_above ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: median_age {
    type: number
    sql: ${TABLE}.median_age ;;
  }
  dimension: population_per_sqmt {
    type: number
    sql: ${TABLE}.population_per_sqmt ;;
  }
  measure: count {
    type: count
    drill_fields: [area_name]
  }
  measure: total_age_0_4 {
    type: sum
    sql: ${TABLE}.age_0_4 ;;
  }
  measure: total_age_5_15 {
    type: sum
    sql: age_5_15 ;;
  }
  measure: total_age_16_64 {
    type: sum
    sql: age_16_64 ;;
  }
  measure: total_age_65_70 {
    type: sum
    sql: age_65_70 ;;
  }
  measure: total_age_71_85 {
    type: sum
    sql: age_71_85 ;;
  }
  measure: total_age_86_and_above {
    type: sum
    sql: age_86_and_above ;;
  }
  measure: total_65_minus {
    type: sum
    sql: (age_0_4 + age_5_15 + age_16_64) ;;
  }
  measure: total_65_minus_percent {
    type: average
    value_format: "#.##"
    sql: (age_0_4 + age_5_15 + age_16_64) * 100 / (age_0_4 + age_5_15 + age_16_64 + age_65_70 + age_71_85 + age_86_and_above);;
  }
  measure: total_65_plus {
    type: sum
    sql: (age_65_70 + age_71_85 + age_86_and_above) ;;
  }
  measure: total_65_plus_percent {
    type: average
    value_format: "#.##"
    sql: (age_65_70 + age_71_85 + age_86_and_above) * 100 / (age_0_4 + age_5_15 + age_16_64 + age_65_70 + age_71_85 + age_86_and_above);;
  }
  measure: total_population {
    type: sum
    sql: (age_0_4 + age_5_15 + age_16_64 + age_65_70 + age_71_85 + age_86_and_above) ;;
  }
}
