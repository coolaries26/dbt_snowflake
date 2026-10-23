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
    }
] %}

SELECT 
    {{ configs[0].columns|join(', ') }}
FROM 
    {{ configs[0].table_name }} AS {{ configs[0].alias }}
