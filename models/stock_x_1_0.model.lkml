connection: "lookerdata"

# include all the views
include: "/views/**/*.view"

datagroup: stock_x_1_0_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: stock_x_1_0_default_datagroup

explore: adidas {}

explore: adidas_trans {}

explore: converse {}

explore: converse_trans {}

explore: jordan {}

explore: jordan_trans {}

explore: nike {}

explore: nike_trans {}

explore: off_white {}

explore: off_white_trans {}

explore: yeezy {}

explore: yeezy_trans {}

explore: shoe_unique_prods {}

explore: shoe_avg_price {}
