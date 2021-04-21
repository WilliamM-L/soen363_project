-- Count of drug-related crimes per activity related to the drug

SELECT count(*) FILTER (WHERE c.description LIKE '%POSS%') AS possession,
       count (*) FILTER (WHERE c.description LIKE '%MANU%') AS manu_deliver,
       (select count(*) from crime where primary_type='NARCOTICS') AS total_narcotics

FROM public.crime c
WHERE fbi_code ='18';
