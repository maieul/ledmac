#!/usr/bin/python
# -*- coding: utf-8 -*-
# This file generate the .png files from .pdf file
# https://www.gnu.org/licenses/gpl-3.0.fr.html
# Copyright : Maïeul Rouquette 2016-…

import os
import subprocess
import argparse
import re
parser = argparse.ArgumentParser()
erreurs = []

directory_files = os.listdir(".")

def get_png_filenames(directory, basename):
    '''In the directory, found all the png file which correspond
    to the basename file
    return set
    '''
    existing_files = os.listdir(directory)
    regexp = re.compile(basename + "-" + "\d+" + ".png")
    filenames = set()

    for filename in existing_files:
        if regexp.match(filename):
            filenames.add(filename)

    return filenames


def diff_png(basename):
    '''Produce a diff between
    the png stored in png folder (older)
    and the png in export folder (new)'''
    global erreurs
    print ("Check change for " + basename)
    olders = get_png_filenames('png', basename)
    news = get_png_filenames('export', basename)

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
            if result == 1:
                erreur = "\x1b[31mFile " + file + " has changed\x1b[0m"
            else:
                erreur = "\x1b[31mFile " + file + " bad result " + str(result) +"\x1b[0m"

            print (erreur)
            erreurs.append(erreur)


def export_png(filename,basename):
    ''' Export a png to pdf'''
    print ("Export " + filename + " to png")
    result_convert = os.system ("convert -density 400 " + filename + " export/" + basename + ".png")
    if result_convert != 0:
        global erreurs
        erreur = "\x1b[31mFile " + filename + " not exported to png. Maybe a bug in convert config. \x1b[0m"
        erreurs.append(erreur)
    return result_convert


def create_repository(rep):
    ''' Create repository if not already exist'''
    if rep not in os.listdir():
        print ("Create " + rep + " respository")
        os.mkdir(rep)

def one_file(filename):
    basename, ext = os.path.splitext(filename)
    if ext != '.pdf':#only the .pdf file
        return
    if export_png(filename,basename) == 0:
        diff_png(basename)

def _main_():
    create_repository("export")
    create_repository("diff")
    parser = argparse.ArgumentParser()
    parser.add_argument("--filename")
    args = parser.parse_args()
    if args.filename:
        one_file(args.filename)
    else:
        #List all the files on the current directory, and check
        for filename in directory_files:
            one_file(filename)
    for e in erreurs:
        print (e)

_main_()
