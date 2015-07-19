#Overview
The eledmac package is for typesetting critical editions.  The eledpar package is an extension of eledmac enabling parallel typesetting in columns or on facing pages.

Eledmac and eledpar are successors of ledmac and ledpar. Ledmac was a LaTeX port, and extension, of the plain TeX EDMAC, TABMAC and EDSTANZA macros.

The package is available on [CTAN](http://www.ctan.org/pkg/eledmac).

#Copyright and Licence

##Authors
- Peter Wilson (Herries Press) herries dot press at earthlink dot net,
- Maïeul Rouquette (new maintainer since june 2011)

##Copyright
- Copyright 2003 --- 2005 Peter R. Wilson
- Copyright 2011 --- .. Maïeul Rouquette

##Licence
This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later version.

The latest version of the license is in [http://www.latex-project.org/lppl.txt](http://www.latex-project.org/lppl.txt) and version 1.3 or later is part of all distributions of LaTeX version 2003/06/01 or later.

This work has the LPPL maintenance status "unmaintained".

This work consists of the files:

- README (this file),
- eledmac.dtx,
- eledmac.ins,
- eledpar.dtx,
- eledpar.ins,

and the derived files:

- eledmac.sty,
- eledpar.sty,
- eledmac.pdf,  (200+ pages)
- eledpar.pdf,  (100+ pages)


The distribution consists of the following files:

- README (this file)
- eledmac.dtx
- eledmac.ins
- eledmac.pdf
- eledpar.dtx
- eledpar.ins
- eledpar.pdf
- makefile
- latexmrc
- examples/
	- *.tex
	- *.pdf
	- makefile

#Installation

- run: `latex eledmac.ins` (which will generate eledmac.sty) and `latex eledpar.ins` (which will generate eledmac.sty)
- move eledmac.sty and eledpar.sty to a location where LaTeX will find it (for more information on this see the FAQ).

To generate a second copy of the manual (which is already supplied as a PDF file):

- run: `make eledmac.pdf`

#Help

- [Users list](http://geekographie.maieul.net/146)
- [StackExchange](https://tex.stackexchange.com/questions/tagged/eledmac), see also the [older tag](https://tex.stackexchange.com/questions/tagged/ledmac)

#Debug and feature requests

Suggestions and bug reports are welcome.

Maïeul Rouquette is the only one maintainer. To help him in his work, please follow these rules:

- Go to the [issues page](https://github.com/maieul/ledmac/issues).
- Open *one issue for each problem*, even if problems are similar.
- Add a [minimal working example](http://www.tex.ac.uk/cgi-bin/texfaq2html?label=minxampl).
- If your report is really a bug, Maïeul Rouquette will open a "branch" to solve your problem. This branch will be called "issueXXX", where "XXX" is the issue number.
- Once the problem has a possible solution, Maïeul Rouquette will send you a zip file and ask you to test it:
	- Download the zip file of the branch (or, if you know Git, go to the branch there):
		- Go to [the project page](https://github.com/maieul/ledmac/).
		- Choose the correct branch in the "branch" menu.
		- Click on the cloud, in the right side.
	- Run the `.ins` files with pdflatex, to obtain the `.sty` files.
	- Put the `.sty` files with your test files (in the same folder).
	- Make your report.






