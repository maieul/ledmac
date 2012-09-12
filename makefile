PACKAGE = *.dtx \
		  *.ins \
		  eledmac.pdf \
		  eledpar.pdf \
		  README \
		  Makefile



.PHONY: all dist clean


all: eledmac.sty eledmac.pdf eledpar.sty eledpar.pdf dist

doc: *.pdf


%.sty: %.ins %.dtx 
	rm -f $*.sty led*tex
	@pdflatex $*.ins

%.pdf: %.sty %.dtx 
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@pdflatex $*.dtx
	@pdflatex $*.dtx


dist: $(PACKAGE)
	@$(RM) ../eledmac.zip
	zip ../eledmac.zip $(PACKAGE)
	

clean:
	@$(RM) *.aux *.log *.out *.toc *tex *.pdf eledmac.sty eledpar.sty  *ind *ilg  *lof *idx *glo *gls ../eledmac.zip

