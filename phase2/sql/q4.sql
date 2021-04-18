-- distribution of other crimes
Select description, count(*) as num_crimes
from crime
where primary_type='OTHER OFFENSE'
group by description
order by num_crimes desc;

-- Crimes classified as other offense with percentage_arrested
Select other_crime.description,
other_crime.num_crimes,
arrested_crimes.num_crimes_arrested,
100*(Cast(arrested_crimes.num_crimes_arrested as float) / other_crime.num_crimes) as percentage_arrested
from
(
	Select description, count(*) as num_crimes
	from crime
	where primary_type='OTHER OFFENSE'
	group by description
) as other_crime,
(
	Select description, count(*) as num_crimes_arrested
	from crime
	where primary_type='OTHER OFFENSE' and arrest=true and arrest is not NULL
	group by description
) as arrested_crimes
where other_crime.description=arrested_crimes.description
order by percentage_arrested desc;
