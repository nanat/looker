#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: sales_info {
  derived_table: {
    sql: select * from sales_info ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sales_id {
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
