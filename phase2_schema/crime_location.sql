CREATE TABLE public.crime_location
(
    cid integer NOT NULL,
    location_description character varying COLLATE pg_catalog."default",
    x_coord integer,
    y_coord integer,
    latitude numeric,
    longitude numeric,
    CONSTRAINT crime_location_pkey PRIMARY KEY (cid),
    CONSTRAINT cid FOREIGN KEY (cid)
        REFERENCES public.crime (cid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.crime_location
    OWNER to postgres;
