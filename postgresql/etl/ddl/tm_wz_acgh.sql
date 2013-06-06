\set ON_ERROR_STOP ON

CREATE TABLE tm_wz.wt_subject_acgh_region
(
  region_id bigint,
  expr_id character varying(500),
  chip double precision,
  segmented double precision,
  flag smallint,
  probloss double precision,
  probnorm double precision,
  probgain double precision,
  probamp double precision,
  num_calls bigint,
  pvalue bigint,
  assay_id bigint,
  patient_id bigint,
  sample_id bigint,
  subject_id character varying(100),
  trial_name character varying(200),
  timepoint character varying(200),
  sample_type character varying(200),
  platform character varying(200),
  tissue_type character varying(200)
);
ALTER TABLE tm_wz.wt_subject_acgh_region OWNER TO tm_wz;
GRANT ALL ON TABLE tm_wz.wt_subject_acgh_region TO tm_cz;

