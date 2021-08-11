configfile: "/home/ubuntu/kg2-code/snakemake-config.yaml"
rule Finish:
    input:
        final_output_file_full = config['FINAL_OUTPUT_FILE_FULL'],
        output_file_orphan_edges = config['OUTPUT_FILE_ORPHAN_EDGES'],
        report_file_full = config['REPORT_FILE_FULL'],
        simplified_output_file_full = config['SIMPLIFIED_OUTPUT_FILE_FULL'],
        simplified_report_file_full = config['SIMPLIFIED_REPORT_FILE_FULL'],
        slim_output_file_full = config['SLIM_OUTPUT_FILE_FULL'],
        placeholder = config['BUILD_DIR'] + "/tsv_placeholder.empty"
    run:
        shell("bash -x " + config['CODE_DIR'] + "/finish-snakemake.sh {input.final_output_file_full} {input.output_file_orphan_edges} {input.report_file_full} {input.simplified_output_file_full} {input.simplified_report_file_full} {input.slim_output_file_full} " + config['KG2_TSV_DIR'] + " \"" + config['S3_CP_CMD'] + "\" " + config['KG2_TSV_TARBALL'] + " " + config['S3_BUCKET'] + " " + config['S3_BUCKET_PUBLIC'] + " " + config['OUTPUT_FILE_BASE'] + " " + config['ONT_LOAD_INVENTORY_FILE'] + " " + config['CODE_DIR'] + " " + config['S3_BUCKET_VERSIONED'] + " " + config['BUILD_DIR'] + " " + config['SIMPLIFIED_REPORT_FILE_BASE'] + " " + config['VENV_DIR'])


include: "Snakefile-pre-etl"
include: "Snakefile-conversion"
include: "Snakefile-post-etl"
