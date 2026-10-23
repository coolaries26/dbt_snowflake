
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select HOST_ID as from_field
    from abnb.silver.silver_listings
    where HOST_ID is not null
),

parent as (
    select HOST_ID as to_field
    from abnb.silver.silver_hosts
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test