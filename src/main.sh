#!/usr/bin/bash
# By Migdal 10/2022
# Pipeline performs de-novo plasmid assembly using pair-end NGS data
# adapters are remove from input reads using cutadapt
# de-novo plasmid assembly is done using SPAdes
USAGE="makePlasmid.sh -1 first.read.fastq.gz -2 second.read.fastq.gz -o out.dir.name [-a AGATCGGAAGAG] [-A AGATCGGAAGAG]
!!!use relative paths to input files!!!"

while getopts ":1:2:o" opt; do
 case $opt in
   1) R1="$OPTARG"
   ;;
   2) R2="$OPTARG"
   ;;
   o) OUTDIR="$OPTARG"
   ;;
   a) ADAPTER1="$OPTARG"
   ;;
   A) ADAPTER2="$OPTARG"
   ;;
   \?) echo "Invalid option -$OPTARG" >&2
   exit 1
   ;;
 esac

 case $OPTARG in
   -*) echo "Option $opt needs a valid argument"
   exit 1
   ;;
 esac
done

if [ -z ${R1} ] || [ -z ${R2} ] || [ -z ${OUTDIR} ]; then
  echo "${USAGE}"
  exit 0
fi

if [ -z ${ADAPTER1} ]; then
  ADAPTER1="AGATCGGAAGAG"
fi

if [ -z ${ADAPTER2} ]; then
  ADAPTER2="AGATCGGAAGAG"
fi

cutadapt -a AGATCGGAAGAG -A AGATCGGAAGAG -o /data/${R1%.fastq.gz}.cutadapt.fastq -p /data/${R2%.fastq.gz}.cutadapt.fastq /data/${R1} /data/${R2} 2>&1 > /data/cutadapt.log
spades.py -o /data/${OUTDIR} --plasmid -1 /data/${R1%.fastq.gz}.cutadapt.fastq -2 /data/${R2%.fastq.gz}.cutadapt.fastq
