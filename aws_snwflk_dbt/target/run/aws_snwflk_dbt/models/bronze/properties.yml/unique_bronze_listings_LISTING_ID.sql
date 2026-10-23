
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    LISTING_ID as unique_field,
    count(*) as n_records

from abnb.bronze.bronze_listings
where LISTING_ID is not null
group by LISTING_ID
having count(*) > 1



  
  
      
    ) dbt_internal_test