CREATE TABLE public.crime
(
    cid integer NOT NULL,
    case_number character varying COLLATE pg_catalog."default",
    iucr character varying COLLATE pg_catalog."default",
    primary_type character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    arrest boolean,
    domestic boolean,
    fbi_code character varying COLLATE pg_catalog."default",
    CONSTRAINT crime_pkey PRIMARY KEY (cid)
)

TABLESPACE pg_default;

ALTER TABLE public.crime
    OWNER to postgres;
