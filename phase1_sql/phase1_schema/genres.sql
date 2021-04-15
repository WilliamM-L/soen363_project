CREATE TABLE public.genres
(
    mid integer NOT NULL,
    genre character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genres_pkey PRIMARY KEY (mid, genre),
    CONSTRAINT mid FOREIGN KEY (mid)
        REFERENCES public.movies (mid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.genres
    OWNER to postgres;
