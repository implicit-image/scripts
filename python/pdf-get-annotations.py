#!/usr/bin/python

import sys
import PyPDF2, traceback
import regex


try:
    src = sys.argv[1]
except:
    src = r'/path/to/my/file.pdf'

try:
    path = sys.argv[2]
    out = open(path, "wt")
except:
    out = sys.stdout


input1 = PyPDF2.PdfFileReader(open(src, "rb"))
nPages = input1.getNumPages()

for i in range(nPages):
    page = input1.getPage(i)
    try:
        for annot in page['/Annots']:
            annotObject = annot.getObject()
            # pages start at zero so their number would be 1 behind real ones
            out.write('page number: {}\n'.format(input1.getPageNumber(page)+1))
            out.write('contents:\n{}\n\n'.format(annotObject['/Contents']))
    except: 
        # there are no annotations on this page
        pass
