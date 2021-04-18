create index ind_prim_type on crime(primary_type);
create index ind_year on crime_date(year);
create index ind_loc_desc on crime_location(location_description);
create index ind_ward on crime_police_area(ward);

