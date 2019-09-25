connection: "lookerdata"

# include all the views
include: "/views/**/*.view"

datagroup: stock_x_1_0_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: stock_x_1_0_default_datagroup

explore: adidas {}

explore: converse {}

explore: jordan {}

explore: nike {}

explore: off_white {}

explore: yeezy {}
