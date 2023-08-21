#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: customer_summary {
  derived_table: {
    sql: select distinct(customer_name) as customer_name, min(order_date) as first_order, max(order_date) as last_order, sum(sales) as revenue, sum(profit) as profit, avg(discount) as discount_average, count(order_id) as total_orders, avg(quantity) as items_per_order_avg
      FROM `api-project-465858738704.sales.superstore_sales`
      group by customer_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_name {
    type: string
    primary_key: yes
    sql: ${TABLE}.customer_name ;;
  }

  dimension: first_order {
    type: date
    datatype: date
    sql: ${TABLE}.first_order ;;
  }

  dimension: last_order {
    type: date
    datatype: date
    sql: ${TABLE}.last_order ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.profit ;;
  }

  dimension: discount_average {
    type: number
    sql: ${TABLE}.discount_average ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  dimension: items_per_order_avg {
    type: number
    sql: ${TABLE}.items_per_order_avg ;;
  }

  dimension: customer_revenue_rank {
    sql: rank() over(order by revenye desc};;
  }

  dimension: customer_revenue_rank_quartile {
    hidden: yes
    sql: trunc((${customer_revenue_rank}-1)*1.0/(${count})/.25) ;;
  }

  dimension: customer_revenue_rank_group {
    group_label: "{{label_placeholder._sql}}" label: "Revenue Rank Group {{label_placeholder._sql}}"
    case: {
      when: {sql:${customer_revenue_rank}<=1000;; label:"Top 1000"}
      when: {sql:${customer_revenue_rank_quartile}=0;; label:"1st 25%"}
      when: {sql:${customer_revenue_rank_quartile}=1;; label:"2nd 25%"}
      when: {sql:${customer_revenue_rank_quartile}=2;; label:"3nd 25%"}
      else:"Bottom 25%"
    }
    html: {% if value == 'Top 1000'%}😀<span style="color: green">{{rendered_value}}</span>{%else%}{{rendered_value}}{%endif%} ;;
  }

  set: detail {
    fields: [
        customer_name,
        first_order,
        last_order,
        revenue,
        profit,
        discount_average,
        total_orders,
        items_per_order_avg
    ]
  }
}
