view: superstore_sales {
  sql_table_name: `api-project-465858738704.sales.superstore_sales` ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }
  dimension: days_to_ship_actual {
    type: number
    sql: ${TABLE}.Days_to_Ship_Actual ;;
  }
  dimension: days_to_ship_scheduled {
    type: number
    sql: ${TABLE}.Days_to_Ship_Scheduled ;;
  }
  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }
  dimension: discount_ratio {
    type: number
    sql: 1.0* ${TABLE}.Discount / NULLIF(${TABLE}.Sales, 0) ;;
  }
  dimension: number_of_records {
    type: number
    sql: ${TABLE}.Number_of_Records ;;
  }
  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Order_Date ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.Order_ID ;;
  }
  dimension: postal_code {
    type: number
    sql: ${TABLE}.Postal_Code ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }
  dimension: profit {
    type: string
    sql: ${TABLE}.Profit ;;
  }
  dimension: profit_ratio {
    type: number
    sql: ${TABLE}.Profit_Ratio ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }
  dimension: sales_forecast {
    type: number
    sql: ${TABLE}.Sales_Forecast ;;
  }
  dimension: sales_per_customer {
    type: number
    sql: ${TABLE}.Sales_per_Customer ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }
  dimension_group: ship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Ship_Date ;;
  }
  dimension: ship_mode {
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }
  measure: number_of_orders {
    type: count
    drill_fields: [customer_name, product_name]
  }
  measure: number_of_customers {
    type: count_distinct
    sql: customer_name ;;
  }
  measure: total_sales {
    type: sum
    sql: ${TABLE}.Sales;;
  }
  measure: total_profit {
    type: sum
    sql: ${TABLE}.Profit;;
  }
  measure: avg_discount_percentage {
    type: average
    sql: ${TABLE}.Discount;;
  }
  measure: avg_profit_ratio {
    type: average
    sql: ${TABLE}.Profit_Ratio;;
  }
}
