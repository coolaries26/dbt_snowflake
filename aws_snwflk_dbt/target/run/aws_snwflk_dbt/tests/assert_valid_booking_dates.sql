
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from abnb.silver.silver_bookings
where created_at < booking_date
  
  
      
    ) dbt_internal_test