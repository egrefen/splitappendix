#!/bin/bash

command -v qpdf >/dev/null 2>&1 || { echo >&2 'Dependency qpdf not found. Please install qpdf.'; exit 1; }
command -v pdfinfo >/dev/null 2>&1 || { echo >&2 'Dependency pdfinfo not found. Please install pdfinfo.'; exit 1; }
command -v awk >/dev/null 2>&1 || { echo >&2 'Dependency awk not found. How do you not have awk installed??'; exit 1; }

if [ $# -ne 2 ]
  then
  	SCRIPT=$(basename "$0")
    echo >&2 "usage: $SCRIPT path_to_paper.pdf first_page_of_appendix"
    exit 1
fi

cd "`dirname "${1}"`"

PAPER=`basename "${1}"`
BEGINAPP=$2
ENDMAIN=$((${BEGINAPP}-1))
LASTPAGE=$(pdfinfo "$PAPER" | grep Pages | awk '{print $2}')

qpdf "${PAPER}" --pages . 1-${ENDMAIN} -- ./submission.pdf
qpdf "${PAPER}" --pages . ${BEGINAPP}-${LASTPAGE} -- ./appendix.pdf
