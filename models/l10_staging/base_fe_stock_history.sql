SELECT "TICKER"                     Company_Ticker
     , "PRIMARY_EXCHANGE_CODE"      Stock_Exchange
     , "PRIMARY_EXCHANGE_NAME"      Stock_Exchange_Name
     , "VARIABLE"                   Variable
     , "VARIABLE_NAME"              Variable_Name
     , "DATE"                       Date
     , "VALUE"                      Value
  FROM {{source('FINANCE__ECONOMICS','STOCK_PRICE_TIMESERIES')}}  src