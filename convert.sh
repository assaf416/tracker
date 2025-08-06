#!/bin/sh
cd tmp
for f in *.pdf.txt; do cat ${f} | base64 -d > ${f%.*}.pdf; done
for f in *.jpeg.txt; do cat ${f} | base64 -d > ${f%.*}.jpeg; done
