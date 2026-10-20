{% set configs =[
    {
        "table_name": "abnb.gold.obt",
        "columns": [
            "BOOKINGS_BOOKING_ID AS BOOKING_ID",
            "BOOKING_LISTING_ID as LISTING_ID",
            "HOSTS_HOST_ID AS HOST_ID",
            "NIGHTS_BOOKED",
            "BOOKING_AMOUNT",
            "SERVICE_FEE",
            "CLEANING_FEE",
            "PER_NIGHT_CHARGES",
            "(PRICE_PER_NIGHT * NIGHTS_BOOKED) + SERVICE_FEE + CLEANING_FEE AS TOTAL_AMOUNT",
            "(PRICE_PER_NIGHT * NIGHTS_BOOKED) + SERVICE_FEE + CLEANING_FEE - BOOKING_AMOUNT AS TOTAL_Payable",
            "ACCOMMODATES",
            "BEDROOMS",
            "BATHROOMS",
            "RESPONSE_RATE"
        ],

        "alias": "fact"
    },
    {
        "table_name": "abnb.gold.dim_listings",
        "columns": [
        ],
        "alias": "dim_listings",
        "join_condition": "dim_listings.LISTING_ID = fact.BOOKING_LISTING_ID"
    },
    {
        "table_name": "abnb.gold.dim_hosts",
        "columns": [
        ],
        "alias": "dim_hosts",
        "join_condition": "dim_hosts.HOST_ID = fact.HOSTS_HOST_ID"
    }
] %}

SELECT 
    {{ configs[0].columns|join(', ') }}
FROM 
    {{ configs[0].table_name }} AS {{ configs[0].alias }}
    {% for config in configs[1:] %}
    LEFT JOIN {{ config.table_name }} AS {{ config.alias }} ON {{ config.join_condition }}
    {% endfor %}