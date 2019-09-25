view: active_bids {
    derived_table: {
      sql: with
              a as (SELECT brand, sum(bid_count) as active_bids FROM `lookerdata.StockX.adidas` group by 1)
              ,b as (SELECT brand,sum(bid_count) as active_bids FROM `lookerdata.StockX.converse` group by 1)
              ,c as (SELECT brand,sum(bid_count) as active_bids FROM `lookerdata.StockX.jordan` group by 1)
              ,d as (SELECT brand,sum(bid_count) as active_bids FROM `lookerdata.StockX.nike` group by 1)
              ,e as (SELECT brand,sum(bid_count) as active_bids FROM `lookerdata.StockX.off_white` group by 1)
              ,f as (SELECT brand,sum(bid_count) as active_bids FROM `lookerdata.StockX.yeezy` group by 1)
              select coalesce(a.brand,b.brand,c.brand,d.brand,e.brand,"Yeezy") as brand,coalesce(a.active_bids,b.active_bids,c.active_bids,d.active_bids,e.active_bids,f.active_bids) as active_bids

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

    dimension: active_bids {
      type: number
      sql: ${TABLE}.active_bids ;;
    }

    measure: bids_active {
      label: "active bids"
      type: max
      sql: ${TABLE}.active_bids ;;
    }

    set: detail {
      fields: [brand, active_bids]
    }
  }
