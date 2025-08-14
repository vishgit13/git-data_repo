select 
cast(product_id as string)  as product_id,
cast(customer_id as string) as customer_id,
  trim(product_name)          as product_name,
  initcap(trim(category))     as category,
  coalesce(brand, initcap(trim(brand))) as brand,
  coalesce(cast(is_active as boolean), true) as is_active,
  cast(release_date as date)  as release_date
   from  {{source('devcatalog1','product')}}