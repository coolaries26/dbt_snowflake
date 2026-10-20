-- the below code is used to create a file format and stage in Snowflake to load CSV files from S3 into Snowflake tables.
-- these need to be run only once from snowflake workspace sql, and not as part of the dbt run.
-- prerequisite: the tables must be created first using the cr_initial_tables.sql script.
-- secret keys for S3 access must be provided in the CREDENTIALS parameter below.
-- secret keys can be obtained from AWS IAM console, and should be kept secure and not shared publicly.

-- Create a file format for CSV files
CREATE OR REPLACE FILE FORMAT  csv_format
  TYPE = 'CSV' 
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

-- Create a stage to load the CSV files from S3
CREATE OR REPLACE STAGE snowstage
FILE_FORMAT = csv_format
URL='s3://snow-bucketa/source_for_snow/';

show stages;
-- ingest the CSV files into the Snowflake tables
-- ingest bookings.csv into the bookings table
COPY INTO bookings
FROM @snowstage
FILES=('bookings.csv')
CREDENTIALS=(aws_key_id = 'S3 Key', aws_secret_key = 'S3 Secret Key');

--- ingest hosts.csv into the hosts table
COPY INTO hosts
FROM @snowstage
FILES=('hosts.csv')
CREDENTIALS=(aws_key_id = 'S3 Key', aws_secret_key = 'S3 Secret Key');

--- ingest listings.csv into the listings table
COPY INTO listings
FROM @snowstage
FILES=('listings.csv')
CREDENTIALS=(aws_key_id = 'S3 Key', aws_secret_key = 'S3 Secret Key');

--sanity check the data load by counting the number of rows in each table
select 'bookings',count(*) from bookings
union
select 'listings',count(*) from listings
union
select 'hosts',count(*) from hosts;