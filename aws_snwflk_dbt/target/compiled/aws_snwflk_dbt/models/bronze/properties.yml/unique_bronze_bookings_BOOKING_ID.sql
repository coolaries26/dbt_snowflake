
    
    

select
    BOOKING_ID as unique_field,
    count(*) as n_records

from abnb.bronze.bronze_bookings
where BOOKING_ID is not null
group by BOOKING_ID
having count(*) > 1


