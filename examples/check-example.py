#!/usr/bin/python
# -*- coding: utf-8 -*-
# This file generate the .png files from .pdf file
# https://www.gnu.org/licenses/gpl-3.0.fr.html
# Copyright : Maïeul Rouquette 2016-…

import os



directory_files = os.listdir(".")


def export_png(filename,basename):
    ''' Export a png to pdf'''
        print ("Export " + filename + " to png")
        os.system ("convert -density 800 " + file_name + " export/" + basename + ".png")


def create_repository_export():
    ''' Create export repository if not already exist'''
    if "export" not in os.listdir():
        print ("Create export respository")
        os.mkdir("export")

def _main_():
    create_repository_export()
    #List all the files on the current directory, and check
    for file_name in directory_files:
        basename, ext = os.path.splitext(file_name)

        if ext != '.pdf':#only the .pdf file
            continue
        export_png(filename,basename)
