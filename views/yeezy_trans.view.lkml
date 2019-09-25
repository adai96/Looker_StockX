view: yeezy_trans {
  sql_table_name: StockX.yeezy_trans ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: brand1 {
    type: string
    sql: ${TABLE}.Brand1 ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
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

  dimension: sale_price {
    type: number
    sql: ${TABLE}.Sale_Price ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.Size ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }
}
