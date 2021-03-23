#!/bin/env bash
set -euo failpipe

bin=$(dirname $0)

input=$1
prefix=$2
outDir=$(dirname $prefix)
mkdir -p $outDir

perl    $bin/triploid.peak.pl $input > $prefix.A.Ratio.tsv
Rscript $bin/triploid.peak.R           $prefix.A.Ratio.tsv $prefix
