
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT *
FROM abnb.silver.silver_bookings
WHERE NIGHTS_BOOKED <= 0
   OR NIGHTS_BOOKED IS NULL
  
  
      
    ) dbt_internal_test