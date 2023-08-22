#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: best_customers {
  derived_table: {
    sql: WITH most_profitable_customers AS (
          select customer_name, sum(profit) as total_profit, sum(sales) as total_sales, sum(quantity) as total_items, count(*) as number_of_orders
          FROM `api-project-465858738704.sales.superstore_sales`
          group by customer_name
          order by total_profit desc
          limit 100
      ),
      highest_sales_customers AS (
          select customer_name, sum(profit) as total_profit, sum(sales) as total_sales, sum(quantity) as total_items, count(*) as number_of_orders
          FROM `api-project-465858738704.sales.superstore_sales`
          group by customer_name
          order by total_sales desc
          limit 100
      ),
      most_items_customers AS (
          select customer_name, sum(profit) as total_profit, sum(sales) as total_sales, sum(quantity) as total_items, count(*) as number_of_orders
          FROM `api-project-465858738704.sales.superstore_sales`
          group by customer_name
          order by total_items desc
          limit 100
      ),
      most_orders_customers AS (
          select customer_name, sum(profit) as total_profit, sum(sales) as total_sales, sum(quantity) as total_items, count(*) as number_of_orders
          FROM `api-project-465858738704.sales.superstore_sales`
          group by customer_name
          order by number_of_orders desc
          limit 100
      )

      SELECT * FROM most_profitable_customers
      INTERSECT DISTINCT
      SELECT * FROM highest_sales_customers
      INTERSECT DISTINCT
      SELECT * FROM most_items_customers
      INTERSECT DISTINCT
      SELECT * FROM most_orders_customers ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: total_profit {
    type: number
    sql: ${TABLE}.total_profit ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.total_sales ;;
  }

  dimension: total_items {
    type: number
    sql: ${TABLE}.total_items ;;
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
  }

  set: detail {
    fields: [
        customer_name,
        total_profit,
        total_sales,
        total_items,
        number_of_orders
    ]
  }
}
