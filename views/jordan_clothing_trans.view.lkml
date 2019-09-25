view: jordan_clothing_trans {
  sql_table_name: StockX.jordan_clothing_trans ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: brand1 {
    type: string
    sql: ${TABLE}.Brand1 ;;
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
