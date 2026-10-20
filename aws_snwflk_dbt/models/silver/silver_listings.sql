{{ config(
    unique_key='LISTING_ID',
    materialized='incremental',
    on_schema_change='sync_all_columns'
) }}

SELECT 
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{ tag('CAST(PRICE_PER_NIGHT AS INT)') }} as PRICE_CATEGORY,
    CREATED_AT
FROM {{ ref( 'bronze_listings') }}
{% if  is_incremental() == True  %}
    WHERE CREATED_AT > (SELECT COALESCE(MAX(CREATED_AT), '1900-01-01') FROM {{ this }})
{% endif %}