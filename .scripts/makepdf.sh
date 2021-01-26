#!/bin/sh

filename=$1
outlocation="$(dirname "$filename")"
outfile="${outlocation}/$(basename "$filename" .ms).pdf"

refer -PS -e -p \
    /home/${USER}/.config/groff/bibliography \
    ${filename} \
    | groff -e -t -ms -Tpdf > ${outfile} &
