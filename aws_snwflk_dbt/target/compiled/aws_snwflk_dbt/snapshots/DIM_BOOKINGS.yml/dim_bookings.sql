with __dbt__cte__booking as (


with booking as (
    SELECT 
    bookings_booking_id AS BOOKING_ID,
    BOOKING_DATE,
    BOOKING_STATUS,
    BOOKING_CREATED_AT AS BOOKING_CREATED_AT
    FROM abnb.gold.obt
)SELECT * FROM booking
) select * from __dbt__cte__booking