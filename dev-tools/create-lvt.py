#!/usr/bin/python3
# This file create the lvt file for testing regression on example file.
# Use : create-lvt.py <file-tex>
#
from sys import argv
import os.path

modele = "\input regression-test\n\
\START\n\
\showoutput\n\
\input {filename}"

files_to_test = argv
for f in files_to_test:
    basename, extension  = os.path.splitext(os.path.basename(f))
    if extension == ".tex":
        content = modele.format(filename = f)
        lvt = open("testfiles/"+basename+".lvt","w")
        lvt.write(content)
        lvt.close()
