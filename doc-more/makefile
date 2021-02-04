.SUFFIXES: .tex

SRC= $(wildcard *.tex)
OBJ= $(SRC:.tex=.pdf)

all:$(OBJ)


%.pdf: %.tex
	latexmk $<

clean:
	@$(RM) *pdf *toc *.1* *.2* *.3* *.eledsec* *.log *.fdb_latexmk *.aux *.end *.ilg *.ind *.idx *.out *.synctex.gz *.synctex.gz\(busy\)
