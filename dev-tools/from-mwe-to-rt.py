#!/usr/bin/python3
# This file create the lvt file for testing regression on example file.
# Use : from-mwe-to-rt.py <file-tex> <config>
#
from sys import argv
import os.path
import subprocess
modele = "\\input regression-test\n\
\\showoutput\n\
{text}"

f = argv[1]
config = argv[2]
directory = "testfiles-"+config+"/"
basename, extension  = os.path.splitext(os.path.basename(f))
if extension == ".tex":
    # create text from .tex file
    tex = open(f)
    text = tex.read()
    text = text.replace('\\begin{document}','\\begin{document} \
\\makeatletter \
\\let\\@bidi@pdfcustomproperties\\relax \
\\makeatother \
            Font initialisation\\START')
    tex.close()

    # create .lvt file
    content = modele.format(text = text)
    lvt = open(directory+basename+".lvt","w")
    lvt.write(content)
    lvt.close()

    # create .tlg file
    subprocess.run(["l3build", "save", "-cconfig-"+config, basename])


