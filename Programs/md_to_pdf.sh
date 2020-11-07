#!/bin/sh


filename=$1
target="$(dirname "${filename}")/pdf"
output="$(basename "$filename" .md).pdf"

mkdir -p ${target}

pandoc \
    --pdf-engine=xelatex \
    -V 'mainfont:DejaVuSerif' \
    -V 'sansfont:DejaVuSans.ttf' \
    -V 'sansfont:DejaVuSansMono.ttf' \
    -V 'geometry:margin=1in' \
    -o "${target}/${output}" $filename &

echo ${target}/${output}
