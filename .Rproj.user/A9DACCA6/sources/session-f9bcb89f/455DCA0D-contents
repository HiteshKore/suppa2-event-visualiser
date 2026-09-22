# SUPPA2 Splicing Event Visualisation

## Overview

The SUPPA2 event visualiser provides a helper script that provides visualisation of splicing events including Skipping Exon (SE),Alternative 5'/3' Splice Sites (A5/A3) 
Mutually Exclusive Exons (MX),Retained Intron (RI) and Alternative First/Last Exons (AF/AL). For reliable identification of splicing analysis performed on long-read RNA-seq data followed by transcrip identificaiton using bambu is recommended. 

script assumes that users have generated SUPPA2 events using (Please reffer SUPPA2 Git page for more information):

```bash
python3.4 suppa.py generateEvents -i <input-file.gtf> -o <output-file> -f ioe -e <list-of-events>
python3.4 suppa.py psiPerEvent --ioe-file <ioe-file> --expression-file <expression-file> -o <output-file> 
python3.4 suppa.py diffSplice --method <empirical> --input <ioe-file> --psi <Cond1.psi> <Cond2.psi> --tpm <Cond1_expression-file> <Cond2_expression-file> --area <1000> --lower-bound <0.05> -gc -o <output-file>
```
The SUPPA2 files generated for specific events must be merged into single files specific to each file from below input files before running the visualisation script.

## Required Input Files

The code requires the following files:

- `.ioe` file*
- PSI file for Condition 1*
- PSI file for Condition 2*
- File containing Delta PSI values*
- GTF file with transcript coordinates

*- files need to be merged.

## Preparing Combined Files

Users should generate the required combined files using the commands below.

### Combine PSI Files

```bash
for i in AF AL A5 A3 MX SE RI ; do
cat "$i/psi_cond1.psi" >> psi_cond1_combined.txt
cat "$i/psi_cond2.psi" >> psi_cond2_combined.txt
done
```

### Combine Delta PSI Files

```bash
for i in AF AL A5 A3 MX SE RI ; do
cat "$i/"deltapsi_cond1_vs_cond2_dpsi.txt >> combined_delta_psi_cond1_vs_cond2.txt
 done
 #modify code as per file names
```

### Remove Duplicate Headers

Remove the duplicated headers from the individual files after merging.

## Events of Interest File

Prepare a file containing the events to be visualised.

Example (`Events_of_interest.txt`):

```text
ENSG00000160323.19;AF:chr9:133414358:133414644-133423101:133422367:133422548-133423101:+
ENSG00000167525.16;AF:chr17:28704843-28710871:28711299:28704843-28711570:28711854:-
ENSG00000181450.18;AL:chr1:227654476-227677179:227677443:227654476-
.19_and_ENSG00000223262.1;A5:chr21:42288073-42288211:42288037-42288211:+
```

Replace the example events with the events from your own dataset.

## Running the Pipeline

Edit all file paths and filenames in run_splicing_visualisation.sh

Run:

```bash
bash run_splicing_visualisation.sh
```

## SUPPA2 References

GitHub Repository:

https://github.com/comprna/SUPPA

Publication:

Trincado JL, Entizne JC, Hysenaj G, et al. SUPPA2 provides fast, accurate, and uncertainty-aware differential splicing analysis across multiple conditions.

https://pubmed.ncbi.nlm.nih.gov/29571299/

## Citation

If you use this workflow, please cite SUPPA2:

Trincado JL, Entizne JC, Hysenaj G, et al. (2018). SUPPA2 provides fast, accurate, and uncertainty-aware differential splicing analysis across multiple conditions. Genome Biology 19, 40.
