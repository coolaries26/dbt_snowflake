{% set configs =[
    {
        "table_name": ref('silver_bookings'),
        "columns": [
            "silver_bookings.BOOKING_ID AS bookings_BOOKING_ID",
            "silver_bookings.LISTING_ID AS BOOKING_LISTING_ID",
            "BOOKING_DATE",
            "NIGHTS_BOOKED",
            "PER_NIGHT_CHARGES",
            "CLEANING_FEE",
            "SERVICE_FEE",
            "BOOKING_STATUS",
            "BOOKING_AMOUNT",
            "silver_bookings.CREATED_AT AS BOOKING_CREATED_AT"
        ],
        "alias": "silver_bookings"
    },
    {
        "table_name": ref('silver_listings'),
        "columns": [
            "PROPERTY_TYPE",
            "silver_listings.HOST_ID AS listings_HOST_ID",
            "silver_listings.LISTING_ID AS listings_LISTING_ID",
            "ROOM_TYPE",
            "BEDROOMS",
            "BATHROOMS",
            "CITY",
            "COUNTRY",
            "ACCOMMODATES",
            "PRICE_PER_NIGHT",
            "PRICE_CATEGORY",
            "silver_listings.CREATED_AT AS LISTING_CREATED_AT"
        ],
        "alias": "silver_listings",
        "join_condition": "listings_LISTING_ID = BOOKING_LISTING_ID"
    },
    {
        "table_name": ref('silver_hosts'),
        "columns": [
            "silver_hosts.HOST_ID AS hosts_HOST_ID",
            "HOST_NAME",
            "HOST_SINCE",
            "IS_SUPERHOST",
            "RESPONSE_RATE",
            "RESPONSE_RATE_CATEGORY",
            "silver_hosts.CREATED_AT AS HOST_CREATED_AT"
        ],
        "alias": "silver_hosts",
        "join_condition": "  silver_hosts.HOST_ID =silver_listings.HOST_ID"
    }
] %}

SELECT 
    {% for config in configs %}
    {{ config.columns|join(', ') }}
    {% if not loop.last %} , {% endif %}
    {% endfor %}
FROM 
    {{ configs[0].table_name }} AS {{ configs[0].alias }}
    {% for config in configs[1:] %}
    LEFT JOIN {{ config.table_name }} AS {{ config.alias }} ON {{ config.join_condition }}
    {% endfor %}