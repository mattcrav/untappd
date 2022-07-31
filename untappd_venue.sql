drop view public.untappd_venue;
CREATE VIEW public.untappd_venue
AS 

with c as 
(
	select
		checkin_id
		,brewery_name 
		,beer_name 
		,venue_name 
		,venue_lat 
		,venue_lng 
		,created_at 
		,row_number() over (partition by round(venue_lat::numeric, 5), round(venue_lng::numeric, 5) order by created_at desc) rn
	from
		untappd_checkin uc 
)
, v as
(
SELECT 
	venue_name,
    max(venue_lat) venue_lat,
    max(venue_lng) venue_lng,
    max(rn) checkin_count,
    min(created_at) first_visit,
    max(created_at) last_visit,
    max(case when rn = 1 then concat(brewery_name, ' ', beer_name) else null end) last_beer
   FROM c
   where venue_name is not null
   GROUP BY venue_name, round(venue_lat::numeric, 5), round(venue_lng::numeric, 5)
  )
  select
  	string_agg(venue_name, ' - ') venue_name,
  	max(venue_lat) venue_lat, 
  	max(venue_lng) venue_lng, 
  	max(checkin_count) checkin_count,
    min(first_visit) first_visit,
    max(last_visit) last_visit,
    max(last_beer) last_beer
  from
  	v
  group by round(venue_lat::numeric, 5), round(venue_lng::numeric, 5)
  ;