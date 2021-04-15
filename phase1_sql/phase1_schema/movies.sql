CREATE TABLE public.movies
(
    mid integer NOT NULL,
    title character varying COLLATE pg_catalog."default",
    year integer,
    rating real,
    num_rating integer,
    CONSTRAINT movies_pkey PRIMARY KEY (mid)
)

TABLESPACE pg_default;

ALTER TABLE public.movies
    OWNER to postgres;
