view: sales_info {
  sql_table_name: `sales.sales_info`;;
  drill_fields: [detail*]

  dimension: sales_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SalesId ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.StoreId ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.ProductId ;;
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: total_revenue {
    type:  number
    sql: ${TABLE}.UnitPrice * ${TABLE}.Quantity;;
  }

  set: detail {
    fields: [
        sales_id,
        store_id,
        product_id,
        date,
        unit_price,
        quantity
    ]
  }
}
