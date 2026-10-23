
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT *
FROM abnb.silver.silver_bookings
WHERE NIGHTS_BOOKED > 0
  AND (
      PER_NIGHT_CHARGES IS NULL
      OR ABS(
          PER_NIGHT_CHARGES
          - ROUND(BOOKING_AMOUNT / NIGHTS_BOOKED, 2)
      ) > 0.01
  )
  
  
      
    ) dbt_internal_test