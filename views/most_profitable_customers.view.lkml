view: most_profitable_customers {
  derived_table: {
    sql: select Customer_Name, count(ORDER_ID) AS total_orders, SUM(SALES) as revenue, SUM(PROFIT) as profit
      FROM `api-project-465858738704.sales.superstore_sales`
      group by Customer_Name
      order by profit desc
      limit 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    primary_key: yes
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.profit ;;
  }

  set: detail {
    fields: [
        customer_name,
  total_orders,
  revenue,
  profit
    ]
  }
}
