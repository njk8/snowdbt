SELECT
  company_ticker, company_name, stock_exchange_name, date
  {{ dbt_utils.pivot(
      column = 'variable_name',
      values = dbt_utils.get_column_values(ref('base_fe_stock_history'), 'variable_name'),
      then_value = 'value'
  ) }}
FROM {{ ref('base_fe_stock_history') }}
GROUP BY company_ticker, company_name, stock_exchange_name, date