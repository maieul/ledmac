#!/usr/bin/python3
# This file just migrate historic vlt file
# 1) have all the code directly in the .vlt file, avoid input
# 2) Put the \START after \begin{document}
# Use : create-tlg.py
#
from glob import glob
import os.path
import subprocess
directories = glob("testfiles-*")

for this_directory  in directories:

    for this_file in os.listdir(this_directory):
        basename, extension  = os.path.splitext(os.path.basename(this_file))
        if extension == ".lvt":
            example = open("examples/"+basename+".tex", "r")
            lvt = open(this_directory+"/"+this_file, "w")

            lvt.write("\input regression-test")
            lvt.write("\showoutput")
            for line in example:
                lvt.write(line)
                if "\\begin{document}" in line:
                    lvt.write("Font Initialisation\START")
            lvt.close()
            example.close()
