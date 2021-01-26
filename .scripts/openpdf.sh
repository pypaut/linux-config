#!/bin/sh

filename=$1
outlocation="$(dirname "$filename")"
outfile="${outlocation}/$(basename "$filename" .ms).pdf"

zathura ${outfile} &
