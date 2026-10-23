

SELECT 
    
    silver_bookings.BOOKING_ID AS bookings_BOOKING_ID, silver_bookings.LISTING_ID AS BOOKING_LISTING_ID, BOOKING_DATE, NIGHTS_BOOKED, PER_NIGHT_CHARGES, CLEANING_FEE, SERVICE_FEE, BOOKING_STATUS, BOOKING_AMOUNT, silver_bookings.CREATED_AT AS BOOKING_CREATED_AT
     , 
    
    PROPERTY_TYPE, silver_listings.HOST_ID AS listings_HOST_ID, silver_listings.LISTING_ID AS listings_LISTING_ID, ROOM_TYPE, BEDROOMS, BATHROOMS, CITY, COUNTRY, ACCOMMODATES, PRICE_PER_NIGHT, PRICE_CATEGORY, silver_listings.CREATED_AT AS LISTING_CREATED_AT
     , 
    
    silver_hosts.HOST_ID AS hosts_HOST_ID, HOST_NAME, HOST_SINCE, IS_SUPERHOST, RESPONSE_RATE, RESPONSE_RATE_CATEGORY, silver_hosts.CREATED_AT AS HOST_CREATED_AT
    
    
FROM 
    abnb.silver.silver_bookings AS silver_bookings
    
    LEFT JOIN abnb.silver.silver_listings AS silver_listings ON listings_LISTING_ID = BOOKING_LISTING_ID
    
    LEFT JOIN abnb.silver.silver_hosts AS silver_hosts ON   silver_hosts.HOST_ID =silver_listings.HOST_ID
    