
    
    

select
    BOOKINGS_BOOKING_ID as unique_field,
    count(*) as n_records

from abnb.gold.obt
where BOOKINGS_BOOKING_ID is not null
group by BOOKINGS_BOOKING_ID
having count(*) > 1


