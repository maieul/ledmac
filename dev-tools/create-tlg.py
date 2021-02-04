#!/usr/bin/python3
# This file create the tlg file for testing regression on example file.
# Use : create-tlg.py <optional file> <optional config>
#
from glob import glob
import os.path
import subprocess
from sys import argv
if len(argv) == 3:
    directories = ["testfiles-" + argv[2]]
    this_file = argv[1] + '.lvt'
else :
    directories = glob("testfiles-*")

def create_file(this_config, this_directory, this_file):
    run = ["l3build", "save", "-c"+this_config, "fichier"]
    basename, extension  = os.path.splitext(os.path.basename(this_file))
    if extension == ".lvt":
        run[3] = basename
        print ("*****")
        print (this_directory+"/"+this_file)
        print ("*****")

        #create the .tlg
        subprocess.run(run)

for this_directory in directories:
    this_config = this_directory.replace("testfiles","config")
    if len(argv) == 3:
        create_file(this_config, this_directory, this_file)
    else:
        for this_file in os.listdir(this_directory):
            create_file(this_config, this_directory, this_file)



