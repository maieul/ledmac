#!/usr/bin/python3
# This file create the tlg file for testing regression on example file.
# Use : create-tlg.py
#
from glob import glob
import os.path
import subprocess
directories = glob("testfiles-*")

for this_directory  in directories:

    # Setting the engine
    pdftex = True
    xetex = True
    luatex = True
    if "luatex" in this_directory:
        xetex = False
        pdftex = False
    elif "utf8" in this_directory:
        pdftex = False

    this_config = this_directory.replace("testfiles","config")
    run = ["l3build", "save", "-epdftex", "-c"+this_config, "fichier"]
    for this_file in os.listdir(this_directory):
        basename, extension  = os.path.splitext(os.path.basename(this_file))
        if extension == ".lvt":
            run[4] = basename
        #create the .tlg
        if pdftex:
            run[2] = "-epdftex"
            subprocess.run(run)
        if xetex:
            run[2] = "-exetex"
            subprocess.run(run)
        if luatex:
            run[2] = "-eluatex"
            subprocess.run(run)

