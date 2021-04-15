CREATE TABLE public.crime_police_area
(
    cid integer NOT NULL,
    block character varying COLLATE pg_catalog."default",
    beat integer,
    district integer,
    ward integer,
    community_area integer,
    CONSTRAINT crime_police_area_pkey PRIMARY KEY (cid),
    CONSTRAINT cid FOREIGN KEY (cid)
        REFERENCES public.crime (cid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.crime_police_area
    OWNER to postgres;
