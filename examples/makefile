all: *.pdf

%.pdf: %.tex
	latexmk $*.tex > /dev/null

clean:
	@$(RM) *pdf *toc *.1* *.2* *.3* *.eledsec* *.log *.fdb_latexmk *.aux *.end *.ilg *.ind *.idx *.out