#!/usr/bin/python
# -*- coding: utf-8 -*-
# This file generate the .png files from .pdf file
# https://www.gnu.org/licenses/gpl-3.0.fr.html
# Copyright : Maïeul Rouquette 2016-…

import os
import subprocess


directory_files = os.listdir(".")

def diff_png(basename):
    '''Produce a diff between
    the png stored in png folder (older)
    and the png in export folder (new)'''

    print ("Check change for" + basename)
    olders = set([x for x in os.listdir('png') if basename in x])
    news = set([x for x in os.listdir('export') if basename in x])

    # Check for new files
    files_created = news - olders
    files_deleted = olders - news
    if len(files_created) !=0:
        print ("\x1b[31mNew files\x1b[0m")
        print ("\x1b[31m"+str(files_created)+"\x1b[0m")
    if len(files_deleted) !=0:
        print ("\x1b[31mDeleted files\x1b[0m")
        print ("\x1b[31m"+str(files_deleted)+"\x1b[0m")

    for file in news & olders:
        old = "png/" + file
        new = "export/" + file
        command = "compare -metric AE " + old + " " + new + " /dev/null"
        result = subprocess.call(command,shell=True,stdout=subprocess.PIPE)

        if result !=0:
            print ("\x1b[31mFile " + file + " has changed\x1b[0m")



def export_png(filename,basename):
    ''' Export a png to pdf'''
    print ("Export " + filename + " to png")
    os.system ("convert -density 800 " + filename + " export/" + basename + ".png")


def create_repository(rep):
    ''' Create repository if not already exist'''
    if rep not in os.listdir():
        print ("Create " + rep + " respository")
        os.mkdir(rep)

def _main_():
    create_repository("export")
    create_repository("diff")
    #List all the files on the current directory, and check
    for filename in directory_files:
        basename, ext = os.path.splitext(filename)

        if ext != '.pdf':#only the .pdf file
            continue
        export_png(filename,basename)
        diff_png(basename)

_main_()
