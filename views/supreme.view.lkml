view: supreme {
  sql_table_name: StockX.supreme ;;

  dimension: average_price {
    type: number
    sql: ${TABLE}.Average_Price ;;
  }

  dimension: bid_count {
    type: number
    sql: ${TABLE}.Bid_Count ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: brand1 {
    type: string
    sql: ${TABLE}.Brand1 ;;
  }

  dimension: current_highest_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Current_Highest_Bid ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: last_sale_price {
    type: number
    sql: ${TABLE}.Last_Sale_Price ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.Retail_Price ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.Size ;;
  }

  dimension: total_sale {
    type: number
    sql: ${TABLE}.Total_Sale ;;
  }

  dimension: total_sale_count {
    type: number
    sql: ${TABLE}.Total_Sale_Count ;;
  }

  dimension: volatility {
    type: number
    sql: ${TABLE}.Volatility ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }
}
