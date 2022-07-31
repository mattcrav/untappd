-- public.untappd definition

-- Drop table

-- DROP TABLE public.untappd;

CREATE TABLE public.untappd (
	beer_name varchar(255) NULL,
	brewery_name varchar(255) NULL,
	beer_type varchar(255) NULL,
	beer_abv float4 NULL,
	beer_ibu int4 NULL,
	comment varchar(255) NULL,
	venue_name varchar(255) NULL,
	venue_city varchar(255) NULL,
	venue_state varchar(255) NULL,
	venue_country varchar(255) NULL,
	venue_lat float4 NULL,
	venue_lng float4 NULL,
	rating_score int4 NULL,
	created_at timestamp NULL,
	checkin_url varchar(255) NULL,
	beer_url varchar(255) NULL,
	brewery_url varchar(255) NULL,
	brewery_country varchar(255) NULL,
	brewery_city varchar(255) NULL,
	brewery_state varchar(255) NULL,
	flavor_profiles varchar(255) NULL,
	purchase_venue varchar(255) NULL,
	serving_type varchar(255) NULL,
	checkin_id int4 NULL,
	bid int4 NULL,
	brewery_id int4 NULL,
	photo_url varchar(255) NULL,
	global_rating_score float4 NULL,
	global_weighted_rating_score float4 NULL,
	tagged_friends varchar(255) NULL,
	total_toasts int4 NULL,
	total_comments int4 NULL
);