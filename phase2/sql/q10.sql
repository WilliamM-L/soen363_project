-- Count of drug-related crimes per activity related to the drug
SELECT count(*) FILTER (
                        WHERE fbi_code ='18'
                            AND c.description LIKE '%POSS%') AS possession,
       count (*) FILTER (
                         WHERE fbi_code ='18'
                             AND c.description LIKE '%DELIVER%') AS manu_deliver
FROM public.crime c;

