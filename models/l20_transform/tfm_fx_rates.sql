{{ 
config(
	  materialized='table'
	  , tags=["Reference Data"]
	  ) 
}}
SELECT src.* 
  FROM {{ref('base_fe_fx_rates')}} src
 WHERE "DATE"           > '2016-01-01'