
    
    

with child as (
    select LISTING_ID as from_field
    from abnb.silver.silver_bookings
    where LISTING_ID is not null
),

parent as (
    select LISTING_ID as to_field
    from abnb.silver.silver_listings
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


