view: rolex_trans {
  sql_table_name: StockX.rolex_trans ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Date ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.Size ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }
}
