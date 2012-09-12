PACKAGE = *.dtx \
		  *.ins \
		  eledmac1.pdf \
		  eledpar.pdf \
		  *eps \
		  README \
		  Makefile



.PHONY: all dist clean


all: eledmac1.sty eledmac1.pdf eledpar.sty eledpar.pdf dist

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
	@$(RM) ../eledmac1.zip
	zip ../eledmac1.zip $(PACKAGE)
	

clean:
	@$(RM) *.aux *.log *.out *.toc *tex *.pdf eledmac1.sty ledarab1.sty eledpar.sty afoot.sty *ind *ilg  *lof *idx *glo *gls ../eledmac1.zip

