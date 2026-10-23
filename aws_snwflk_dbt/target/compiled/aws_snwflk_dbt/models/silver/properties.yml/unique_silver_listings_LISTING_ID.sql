
    
    

select
    LISTING_ID as unique_field,
    count(*) as n_records

from abnb.silver.silver_listings
where LISTING_ID is not null
group by LISTING_ID
having count(*) > 1


