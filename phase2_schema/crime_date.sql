CREATE TABLE public.crime_date
(
    cid integer NOT NULL,
    c_date timestamp without time zone,
    year integer,
    updated_on timestamp without time zone,
    CONSTRAINT crime_date_pkey PRIMARY KEY (cid),
    CONSTRAINT crime_date_cid_fkey FOREIGN KEY (cid)
        REFERENCES public.crime (cid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.crime_date
    OWNER to postgres;
