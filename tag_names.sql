CREATE TABLE public.tag_names
(
    tid integer NOT NULL,
    tag character varying COLLATE pg_catalog."default",
    CONSTRAINT tag_names_pkey PRIMARY KEY (tid)
)

TABLESPACE pg_default;

ALTER TABLE public.tag_names
    OWNER to postgres;
