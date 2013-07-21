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
	rm -f $*.sty $*tex
	@pdflatex $*.ins

%.pdf: %.sty %.dtx 
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@pdflatex $*.dtx
	@pdflatex $*.dtx


dist: $(PACKAGE)
	rm -rf eledmac
	mkdir eledmac
	cp $(PACKAGE) eledmac
	@$(RM) ../eledmac.zip
	zip -r ../eledmac.zip eledmac
	

clean:
	@$(RM) *.aux *.log *.out *.toc *tex *.pdf eledmac.sty eledpar.sty  *ind *ilg  *lof *idx *glo *gls ../eledmac.zip

