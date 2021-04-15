CREATE TABLE public.actors
(
    mid integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    cast_position integer,
    CONSTRAINT actors_pkey PRIMARY KEY (mid, name),
    CONSTRAINT mid FOREIGN KEY (mid)
        REFERENCES public.movies (mid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.actors
    OWNER to postgres;
