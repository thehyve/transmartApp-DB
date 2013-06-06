\set ON_ERROR_STOP ON

-------------------------------------------------------------------
-- Define 'seq_region_id' sequence. 
-- Needed to fill 'deapp.de_chromosomal_region' (unigue "region_id")

CREATE SEQUENCE tm_cz.seq_region_id;
ALTER  SEQUENCE tm_cz.seq_region_id OWNER to tm_cz;
