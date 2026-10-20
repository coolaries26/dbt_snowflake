{{ config(materialized='ephemeral') }}

with booking as (
    SELECT 
    bookings_booking_id AS BOOKING_ID,
    BOOKING_DATE,
    BOOKING_STATUS,
    BOOKING_CREATED_AT AS BOOKING_CREATED_AT
    FROM {{ ref('obt') }}
)SELECT * FROM booking