{{ config(materialized='ephemeral') }}

with listing as (
    SELECT 
    listings_LISTING_ID AS LISTING_ID,
    ROOM_TYPE,
    PROPERTY_TYPE,
    CITY,
    COUNTRY,
    PRICE_CATEGORY,
    LISTING_CREATED_AT AS CREATED_AT
    FROM {{ ref('obt') }}
)SELECT * FROM listing