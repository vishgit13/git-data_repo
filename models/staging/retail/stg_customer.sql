select
  cast(customer_id as string) as customer_id,
  initcap(trim(name)) as full_name,
  lower(email)              as email,
  cast(signup_date as timestamp) as created_at,
  cast(address as string) as address,
  cast(state as string) as state,
  total_amount,
  discount,
  net_amount,
  total_amount_purchase,
  CLV
from  {{source('devcatalog1','customer1')}}