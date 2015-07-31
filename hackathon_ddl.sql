set schema 'campaign';

/* a dummy datamart for direct marketing */
/* contains
	1. campaign contact history
	2. campaign response
	3. customer dimension
	4. service dimension
	5. product dimension
	6. campaign dimension
*/

/* fact tables */
/* campaign contact history */
create table campaign.contact_history (
	row_id integer primary key
	, campaign_delivery_date date
	, campaign_id integer
	, customer_id integer
	, service_id integer
	, TM_agent_id integer
	, campaign_status varchar(50)
);

/* response for campaigns */
create table campaign.response (
	row_id integer primary key
	, contact_history_id integer
	, response_time date
	, response_medium varchar(50)
	, response_type varchar(50)
	, score integer
);

/* dimension tables */
/* customer dimension */
create table campaign.customer (
	row_id integer primary key
	, cust_num integer
	, first_name varchar(100)
	, last_name varchar(100)
	, DOB date
	, suburb varchar(50)
	, postcode integer
	, contact_number integer
	, contact_email varchar(100)
	, optout_TM_flag integer
	, optout_SMS_flag integer
	, optout_DM_flag integer
	, optout_EDM_flag integer
	, customer_tenure integer
	, customer_segmentation varchar(50)
	, start_date date
	, end_date date
);

/* service table */
create table campaign.service (
	row_id integer primary key
	, service_number varchar(100)
	, service_status varchar(50) -- active, deactive
	, product_id integer
	, service_start_date date -- service activation date
	, service_end_date date
);

create table campaign.product (
	row_id integer primary key
	, product_name varchar(100)
	, product_type varchar(100)
	, product_price decimal(20,2)
	, start_date date
	, end_date date
);

/* campaign reference */
create table campaign.dim_campaign (
	row_id integer primary key
	, campaign_name varchar(100)
	, campaign_description varchar(255)
	, campaign_type varchar(50) -- upsell, xsell, retention etc.
	, campaign_start_date date
	, campaign_end_date date
	, target_product1 integer
	, target_product2 integer
	, target_product3 integer
	, channel varchar(50) -- TM/SMS/DM/EDM
	, marketing_team varchar(100)
	, frequency varchar(50)
	, treatment varchar(50)
	, offer_id integer
	, control_flag integer
	, campaign_segment varchar(100)
);

/* offer dim */
create table campaign.offer (
	row_id integer primary key
	, offer_name varchar(100)
	, offer_value integer
);
