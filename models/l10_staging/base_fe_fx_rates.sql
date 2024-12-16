SELECT "BASE_CURRENCY_NAME"        currency
     , "BASE_CURRENCY_ID"          currency_unit
     , "QUOTE_CURRENCY_ID"         quote_currency
     , "DATE"                      Date
     , "VALUE"                     value
     , "VARIABLE"                  conv_type
  FROM {{source('FINANCE__ECONOMICS','FX_RATES_TIMESERIES')}}  src 