view: shoe_unique_prods {
    derived_table: {
      sql: with
              a as (SELECT brand, count(distinct item_name) as unique FROM `lookerdata.StockX.adidas` group by 1)
              ,b as (SELECT brand,count(distinct item_name) as unique FROM `lookerdata.StockX.converse` group by 1)
              ,c as (SELECT brand,count(distinct item_name) as unique FROM `lookerdata.StockX.jordan` group by 1)
              ,d as (SELECT brand,count(distinct item_name) as unique FROM `lookerdata.StockX.nike` group by 1)
              ,e as (SELECT brand,count(distinct item_name) as unique FROM `lookerdata.StockX.off_white` group by 1)
              ,f as (SELECT brand,count(distinct item_name) as unique FROM `lookerdata.StockX.yeezy` group by 1)
              select coalesce(a.brand,b.brand,c.brand,d.brand,e.brand,"Yeezy") as brand,coalesce(a.unique,b.unique,c.unique,d.unique,e.unique,f.unique) as unique

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

    dimension: unique {
      type: number
      sql: ${TABLE}.unique ;;
    }

    measure: unique_shoes {
      type: max
      sql: ${TABLE}.unique ;;
    }

    set: detail {
      fields: [brand, unique]
    }
  }
