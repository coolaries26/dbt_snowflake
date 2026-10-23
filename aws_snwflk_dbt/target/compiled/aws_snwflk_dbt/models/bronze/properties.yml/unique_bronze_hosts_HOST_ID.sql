
    
    

select
    HOST_ID as unique_field,
    count(*) as n_records

from abnb.bronze.bronze_hosts
where HOST_ID is not null
group by HOST_ID
having count(*) > 1


