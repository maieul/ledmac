.SUFFIXES: .tex

SRC= $(wildcard *.tex)
OBJ= $(SRC:.tex=.pdf)

all:$(OBJ)

PDF:$(OBJ)

%.pdf: %.tex
	latexmk $<

2-glossaries.pdf: 2-glossaries.tex
	pdflatex 2-glossaries
	pdflatex 2-glossaries
	pdflatex 2-glossaries
	makeglossaries 2-glossaries
	pdflatex 2-glossaries

3-reledpar_pages_different_languages_lualatex.pdf: 3-reledpar_pages_different_languages_lualatex.tex
	latexmk --lualatex $<

3-reledpar_columns_different_languages.pdf: 3-reledpar_columns_different_languages.tex
	latexmk --xelatex $<

2-reledmac-right-to-left.pdf: 2-reledmac-right-to-left.tex
	latexmk --lualatex $<

clean:
	@$(RM) *pdf *toc *.1* *.2* *.3* *.4* *.5* *.6* *.7* *.8* *.9* *.eledsec* *.Aend* *.Bend* *.fls* *.xdv* *.glg* *.glo* *.gls* *.ist* *.log *.fdb_latexmk *.aux *.end *.ilg *.ind *.idx *.out *.synctex.gz *.synctex.gz\(busy\)
