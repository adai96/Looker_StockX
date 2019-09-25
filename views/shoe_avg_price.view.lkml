view: shoe_avg_price {
  derived_table: {
    sql: with
      a as (SELECT brand,avg(average_price) as avg_price FROM `lookerdata.StockX.adidas` group by 1)
      ,b as (SELECT brand,avg(average_price) as avg_price FROM `lookerdata.StockX.converse` group by 1)
      ,c as (SELECT brand,avg(average_price) as avg_price FROM `lookerdata.StockX.jordan` group by 1)
      ,d as (SELECT brand,avg(average_price) as avg_price FROM `lookerdata.StockX.nike` group by 1)
      ,e as (SELECT brand,avg(average_price) as avg_price FROM `lookerdata.StockX.off_white` group by 1)
      ,f as (SELECT brand as b,brand as brand,avg(average_price) as avg_price FROM `lookerdata.StockX.yeezy` group by 1)


      select coalesce(a.brand,b.brand,c.brand,d.brand,e.brand,"Yeezy") as brand,coalesce(a.avg_price,b.avg_price,c.avg_price,d.avg_price,e.avg_price,f.avg_price) as avg_price
      from a
      full outer join b on a.brand = b.brand
      full outer join c on a.brand = c.brand
      full outer join d on a.brand = d.brand
      full outer join e on a.brand = e.brand
      full outer join f on c.brand = f.brand
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: avg_price {
    type: number
    sql: ${TABLE}.avg_price ;;
  }

  measure: avg_price_measure {
    label: "average_price"
    type: average
    sql: ${avg_price} ;;
  }

  set: detail {
    fields: [brand, avg_price]
  }
}
