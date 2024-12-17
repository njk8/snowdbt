WITH combined AS (
    {{ dbt_utils.union_relations(
        relations=[ref('manual_book1'), ref('manual_book2')]
    ) }}
)
SELECT Book,Date,Trader,Instrument,Action,Cost,Currency,Volume,Cost_Per_Share,
       CASE 
           WHEN stock_exchange_name = 'NASDAQ' THEN 'NASDAQ CAPITAL MARKET'
           ELSE stock_exchange_name
       END AS stock_exchange_name
FROM combined
