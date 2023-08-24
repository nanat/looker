view: superstore_sales {
  sql_table_name: `api-project-465858738704.sales.superstore_sales` ;;

  measure: total_customers {
    type: number
    sql:  select count(*) as total_customers from (
      select distinct(customer_name)
      FROM `api-project-465858738704.sales.superstore_sales`);;
  }

  # dimension: clv {
  #   type: number
  #   sql: SELECT avg(Sales) * count(Order_ID)/count(distinct(Customer_Name)) *
  #     (SELECT avg_customer_lifespan FROM (
  #       SELECT AVG(customer_lifetime) as avg_customer_lifespan FROM (
  #         SELECT date_diff(max(Order_Date), min(Order_Date), YEAR) as customer_lifetime
  #         FROM `api-project-465858738704.sales.superstore_sales`
  #         GROUP BY Customer_Name
  #       )
  #     )
  #   )
  #   FROM `api-project-465858738704.sales.superstore_sales` ;;
  # }

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
    sql: 1.0 * ${TABLE}.Discount / NULLIF(${TABLE}.Sales, 0) ;;
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
    primary_key: yes
    sql: ${TABLE}.Order_ID ;;
  }
  dimension: postal_code {
    type: zipcode
    # map_layer_name: us_zipcode_tabulation_areas
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
    drill_fields: [state, city, postal_code]
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
    map_layer_name:  us_states
    drill_fields: [city, postal_code]
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
    sql: ${TABLE}.Customer_Name ;;
  }
  measure: total_sales {
    type: sum
    sql: ${TABLE}.Sales;;
  }
  measure: total_profit {
    type: sum
    sql: ${TABLE}.Profit;;
  }
  measure: avg_discount {
    type: average
    sql: ${TABLE}.Sales * ${TABLE}.Discount / 100;;
  }
  measure: avg_discount_percentage {
    type: average
    sql: ${TABLE}.Discount;;
  }
  measure: avg_profit_ratio {
    type: average
    sql: ${TABLE}.Profit_Ratio;;
    value_format: "0.00"
  }
  measure: avg_profit_percent {
    type: average
    sql: ${TABLE}.Profit_Ratio * 100;;
  }
  measure: sub_category_count {
    type: count_distinct
    sql: ${TABLE}.Sub_Category;;
  }
  measure: avg_purchase_value {
    type: average
    sql: ${TABLE}.Sales;;
  }
  measure: customer_lifespan_in_days {
    type: number
    sql:  DATE_DIFF(max(${order_date}), min(${order_date}), DAY) ;;
  }

  measure: customer_revenue_rank {
    sql: rank() over(order by ${total_sales} desc) ;;
    type: number
  }
  measure: customer_revenue_rank_quartile {
    hidden: no
    sql: trunc((${customer_revenue_rank}-1)*1.0/(${total_customers})/.25) ;;
  }
  # dimension: label_placeholder {
  #   hidden: yes
  #   sql: (Lifetime);; # We will need to override this sql to update labels when extending this view and applying different filters.
  # }
  measure: customer_revenue_rank_group {
    group_label: "revenue_rank_group" label: "Revenue Rank Group"
    case: {
      when: {sql:${customer_revenue_rank}<=20;; label:"Top 20"}
      when: {sql:${customer_revenue_rank_quartile}=0;; label:"1st 25%"}
      when: {sql:${customer_revenue_rank_quartile}=1;; label:"2nd 25%"}
      when: {sql:${customer_revenue_rank_quartile}=2;; label:"3rd 25%"}
      else:"Bottom 25%"
    }
    html: {% if value == 'Top 20'%}😀<span style="color: green">{{rendered_value}}</span>
    {% elsif value == '1st 25%'%}😊<span style="color: blue">{{rendered_value}}</span>
    {% elsif value == '2nd 25%'%}😑<span style="color: purple">{{rendered_value}}</span>
    {% elsif value == '3rd 25%'%}😢<span style="color: orange">{{rendered_value}}</span>
    {% elsif value == 'Bottom 25%'%}😡<span style="color: red">{{rendered_value}}</span>
    {%else%}{{rendered_value}}{%endif%} ;;
  }

  measure: sales_min {
    type:  min
    sql: ${sales};;
  }
  measure: sales_25 {
    type:  percentile
    percentile: 25
    sql: ${sales};;
  }
  measure: sales_median {
    type:  median
    sql: ${sales};;
  }
  measure: sales_75 {
    type:  percentile
    percentile: 75
    sql: ${sales};;
  }
  measure: sales_max {
    type:  max
    sql: ${sales};;
  }
}
