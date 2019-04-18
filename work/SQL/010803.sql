SELECT 
  goods_id 
FROM
  goods 
WHERE country = 'id' 
  AND state = 'active' 
  AND reseller_price > 0 
  AND (
    first_order_time > strtotime ('-15 day') 
    OR first_order_time IS NULL 
    OR first_online_time > strtotime ('-3 month')
  ) 
GROUP BY brand_id,
  model 
ORDER BY first_online_time DESC,
  sort DESC 
LIMIT 30 
  SELECT 
    * 
  FROM
    goods 
  WHERE goods_id = 111119 
  
  
  
  
  
  