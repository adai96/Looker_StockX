view: active_asks {
    derived_table: {
      sql: with
              a as (SELECT brand, sum(ask_count) as active_asks FROM `lookerdata.StockX.adidas` group by 1)
              ,b as (SELECT brand,sum(ask_count) as active_asks FROM `lookerdata.StockX.converse` group by 1)
              ,c as (SELECT brand,sum(ask_count) as active_asks FROM `lookerdata.StockX.jordan` group by 1)
              ,d as (SELECT brand,sum(ask_count) as active_asks FROM `lookerdata.StockX.nike` group by 1)
              ,e as (SELECT brand,sum(ask_count) as active_asks FROM `lookerdata.StockX.off_white` group by 1)
              ,f as (SELECT brand,sum(ask_count) as active_asks FROM `lookerdata.StockX.yeezy` group by 1)
              select coalesce(a.brand,b.brand,c.brand,d.brand,e.brand,"Yeezy") as brand,coalesce(a.active_asks,b.active_asks,c.active_asks,d.active_asks,e.active_asks,f.active_asks) as active_asks

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

    dimension: active_asks {
      type: number
      sql: ${TABLE}.active_asks ;;
    }

    measure: asks_active {
      type: max
      sql: ${TABLE}.active_asks ;;
    }

    set: detail {
      fields: [brand, active_asks]
    }
  }
