
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    BOOKINGS_BOOKING_ID as unique_field,
    count(*) as n_records

from abnb.gold.obt
where BOOKINGS_BOOKING_ID is not null
group by BOOKINGS_BOOKING_ID
having count(*) > 1



  
  
      
    ) dbt_internal_test