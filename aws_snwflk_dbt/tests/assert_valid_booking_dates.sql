select *
from {{ ref('silver_bookings') }}
where created_at < booking_date