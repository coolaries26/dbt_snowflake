
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    HOST_ID as unique_field,
    count(*) as n_records

from abnb.silver.silver_hosts
where HOST_ID is not null
group by HOST_ID
having count(*) > 1



  
  
      
    ) dbt_internal_test