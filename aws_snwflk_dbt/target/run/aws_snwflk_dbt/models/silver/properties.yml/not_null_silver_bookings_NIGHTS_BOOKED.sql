
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select NIGHTS_BOOKED
from abnb.silver.silver_bookings
where NIGHTS_BOOKED is null



  
  
      
    ) dbt_internal_test