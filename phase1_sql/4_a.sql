CREATE INDEX ind_act_mid on actors (mid);
CREATE INDEX ind_act_name on actors (name);

CREATE INDEX ind_gen_mid on genres(mid);
CREATE INDEX ind_gen_gen on genres(genre);

CREATE INDEX ind_tags_mid on tags(mid);
CREATE INDEX ind_tags_tid on tags(tid);
