SELECT tsh.*
     , fx_gbp.value * pre_market_open          AS gbp_open      
     , fx_gbp.value * all_day_high			   AS gbp_high		
     , fx_gbp.value * all_day_low              AS gbp_low      
     , fx_gbp.value * post_market_close        AS gbp_close    
     , fx_eur.value * pre_market_open          AS eur_open      
     , fx_eur.value * all_day_high			   AS eur_high		
     , fx_eur.value * all_day_low              AS eur_low      
     , fx_eur.value * post_market_close        AS eur_close    
  FROM {{ref('tfm_stock_history')}} tsh
     , {{ref('tfm_fx_rates')}}      fx_gbp
     , {{ref('tfm_fx_rates')}}      fx_eur
 WHERE fx_gbp.conv_type             = 'usd_gbp'     
   AND fx_eur.conv_type             = 'usd_eur'     
   AND tsh.date                     = fx_gbp.date
   AND tsh.date                     = fx_eur.date