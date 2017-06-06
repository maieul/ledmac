.SUFFIXES: .tex

SRC= $(wildcard *.tex)
OBJ= $(SRC:.tex=.pdf)

all:$(OBJ)
	python3 check-example.py


%.pdf: %.tex
	latexmk $<

2-glossaries.pdf: 2-glossaries.tex
	xelatex 2-glossaries
	xelatex 2-glossaries
	xelatex 2-glossaries
	makeglossaries 2-glossaries
	xelatex 2-glossaries

3-reledpar_pages_different_languages_lualatex.pdf: 3-reledpar_pages_different_languages_lualatex.tex
	lualatex $<

clean:
	@$(RM) *pdf *toc *.1* *.2* *.3* *.eledsec* *.log *.fdb_latexmk *.aux *.end *.ilg *.ind *.idx *.out *.synctex.gz *.synctex.gz\(busy\)
