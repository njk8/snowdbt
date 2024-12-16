WITH cst AS
(
SELECT company_ticker, stock_exchange_name, variable_name, date, value 
  FROM {{ref('base_fe_stock_history')}} src
 WHERE variable_name IN ('Pre-Market Open','All-Day Low','Post-Market Close', 'Nasdaq Volume', 'All-Day High') 
)
SELECT * 
  FROM cst
  PIVOT(SUM(Value) for variable_name IN ('Pre-Market Open','All-Day Low','Post-Market Close', 'Nasdaq Volume', 'All-Day High') ) 
  AS p(company_ticker, stock_exchange_name, date, pre_market_open ,all_day_low,post_market_close,nasdaq_volume,all_day_high)  