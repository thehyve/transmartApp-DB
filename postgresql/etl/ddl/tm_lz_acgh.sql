\set ON_ERROR_STOP ON

CREATE TABLE tm_lz.lt_chromosomal_region (
    region_id     bigserial PRIMARY KEY,
    gpl_id        varchar(50) REFERENCES deapp.de_gpl_info,
    chromosome    varchar(2),
    start_bp      bigint,
    end_bp        bigint,
    num_probes    integer,
    region_name   varchar(100),
    cytoband      varchar(100),
    -- next: same as de_mrna_annotation
    gene_symbol   varchar(100),
    gene_id       bigint,
    organism      varchar(200)
);
ALTER TABLE tm_lz.lt_chromosomal_region OWNER TO tm_lz;
GRANT ALL ON TABLE tm_lz.lt_chromosomal_region TO tm_cz;

CREATE TABLE tm_lz.lt_src_acgh_data
(
  trial_name character varying(25),
  region_name character varying(100),
  expr_id character varying(100),
  chip character varying(50),
  segmented character varying(50),
  flag character varying(50),
  probloss character varying(50),
  probnorm character varying(50),
  probgain character varying(50),
  probamp  character varying(50)
);
ALTER TABLE tm_lz.lt_src_acgh_data OWNER TO tm_lz;
GRANT ALL ON TABLE tm_lz.lt_src_acgh_data TO tm_cz;

