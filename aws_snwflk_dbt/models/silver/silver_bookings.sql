{{ config(
    unique_key='BOOKING_ID',
    materialized='incremental',
    on_schema_change='sync_all_columns'
) }}


SELECT 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    NIGHTS_BOOKED,
    {{ divide('BOOKING_AMOUNT','NIGHTS_BOOKED', 2) }} AS PER_NIGHT_CHARGES,
    CLEANING_FEE,
    SERVICE_FEE,
    BOOKING_STATUS,
    BOOKING_AMOUNT,
    CREATED_AT
FROM {{ref('bronze_bookings')}}
{% if  is_incremental() == True  %}
    WHERE 'CREATED_AT' > (SELECT COALESCE(MAX('CREATED_AT'), '1900-01-01') FROM {{ this }})
{% endif %}
AND BOOKING_STATUS <> 'CANCELLED'
