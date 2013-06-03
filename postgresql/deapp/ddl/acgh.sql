CREATE TABLE deapp.de_chromosomal_region (
    region_id     bigserial PRIMARY KEY,
    gpl_id        varchar(50) REFERENCES deapp.de_gpl_info,
    chromosome    varchar(2),
    start_bp      bigint,
    end_bp        bigint,
    num_probes    integer,
    region_name   varchar(100),
    -- next: same as de_mrna_annotation
    gene_symbol   varchar(100),
    gene_id       bigint,
    organism      varchar(200)
)
TABLESPACE deapp;
ALTER TABLE deapp.de_chromosomal_region OWNER TO deapp;
GRANT ALL ON TABLE deapp.de_chromosomal_region TO deapp;
GRANT ALL ON TABLE deapp.de_chromosomal_region TO biomart_user;

CREATE TABLE deapp.de_subject_acgh_data (
    trial_name varchar(50),
    region_id  bigint REFERENCES deapp.de_chromosomal_region,
    assay_id   bigint,           -- join de_subject_sample_mapping w/ trial_name?
    patient_id bigint,           -- join i2b2demodata.patient_dimension
    chip       double precision, -- log2ratio
    segmented  double precision, -- segmented log2ratio
    flag       smallint,         -- call  -1:loss, 0:normal, 1:gain, 2:amplification
    probloss   double precision,
    probnorm   double precision,
    probgain   double precision,
    probamp    double precision,
    PRIMARY KEY(assay_id, region_id)
)
TABLESPACE deapp;
ALTER TABLE deapp.de_subject_acgh_data OWNER TO deapp;
GRANT ALL ON TABLE deapp.de_subject_acgh_data TO deapp;
GRANT ALL ON TABLE deapp.de_subject_acgh_data TO biomart_user;

CREATE INDEX de_subject_acgh_data_region ON
    deapp.de_subject_acgh_data(region_id);
CREATE INDEX de_subject_acgh_data_patient ON
    deapp.de_subject_acgh_data(patient_id);
COMMENT ON COLUMN deapp.de_subject_acgh_data.chip
    IS 'log2ratio';
COMMENT ON COLUMN deapp.de_subject_acgh_data.segmented
    IS 'segmented log2ratio';
COMMENT ON COLUMN deapp.de_subject_acgh_data.flag
    IS 'call  -1:loss, 0:normal, 1:gain, 2:amplification';
