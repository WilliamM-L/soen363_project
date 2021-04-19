-- Rate of crime of top 4 drugs
SELECT count(*) FILTER (
                         WHERE c.description LIKE '%CANNABIS%') AS Cannabis,
       count (*) FILTER (
                         WHERE c.description LIKE '%CRACK%') AS Crack,
       count (*) FILTER (
                         WHERE c.description LIKE '%HEROIN%') AS Heroin,
       count (*) FILTER (
                         WHERE c.description LIKE '%COCAINE%') AS Cocaine
       (select count(*) from crime where primary_type='NARCOTICS') AS total_narcotics
FROM public.crime c
WHERE fbi_code='18';
