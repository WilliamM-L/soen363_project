CREATE TABLE public.tags
(
    mid integer NOT NULL,
    tid integer NOT NULL,
    CONSTRAINT tags_pkey PRIMARY KEY (mid, tid),
    CONSTRAINT mid FOREIGN KEY (mid)
        REFERENCES public.movies (mid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT tid FOREIGN KEY (tid)
        REFERENCES public.tag_names (tid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.tags
    OWNER to postgres;
