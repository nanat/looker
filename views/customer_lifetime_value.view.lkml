view: customer_lifetime_value {
  derived_table: {
    sql: SELECT avg(Sales) * count(Order_ID)/count(distinct(Customer_Name)) *
        (SELECT avg_customer_lifespan FROM (
          SELECT AVG(customer_lifetime) as avg_customer_lifespan FROM (
          SELECT date_diff(max(Order_Date), min(Order_Date), YEAR) as customer_lifetime
          FROM `api-project-465858738704.sales.superstore_sales`
          GROUP BY Customer_Name
        ))
      ) as clv
      FROM `api-project-465858738704.sales.superstore_sales` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: clv {
    type: number
    sql: ${TABLE}.clv ;;
  }

  set: detail {
    fields: [
      clv
    ]
  }
}
