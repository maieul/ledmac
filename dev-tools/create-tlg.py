#!/usr/bin/python3
# This file create the tlg file for testing regression on example file.
# Use : create-tlg.py
#
from glob import glob
import os.path
import subprocess
directories = glob("testfiles-*")

for this_directory  in directories:

    this_config = this_directory.replace("testfiles","config")
    run = ["l3build", "save", "-c"+this_config, "fichier"]
    for this_file in os.listdir(this_directory):
        basename, extension  = os.path.splitext(os.path.basename(this_file))
        if extension == ".lvt":
            run[3] = basename
            print ("*****")
            print (this_directory+"/"+this_file)
            print ("*****")

            #create the .tlg
            subprocess.run(run)

