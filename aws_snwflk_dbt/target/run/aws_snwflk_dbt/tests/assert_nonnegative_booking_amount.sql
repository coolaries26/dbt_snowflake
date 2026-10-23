
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT *
FROM abnb.silver.silver_bookings
WHERE BOOKING_AMOUNT < 0
   OR BOOKING_AMOUNT IS NULL
  
  
      
    ) dbt_internal_test