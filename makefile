PACKAGE = *.dtx \
		  *.ins \
		  eledmac.pdf \
		  eledpar.pdf \
		  README \
		  Makefile \
		  latexmkrc \



.PHONY: all dist clean


all: eledmac.sty eledmac.pdf eledpar.sty eledpar.pdf dist

doc: *.pdf

README: README.md
	cp README.md README

%.sty: %.ins %.dtx 
	rm -f $*.sty $*tex
	@pdflatex $*.ins

%.pdf: %.sty %.dtx 
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@pdflatex $*.dtx
	@pdflatex $*.dtx


dist: $(PACKAGE) examples
	rm -rf eledmac
	mkdir eledmac
	mkdir eledmac/examples
	$(MAKE) -C examples all
	cp examples/*pdf eledmac/examples
	cp examples/*tex eledmac/examples
	cp examples/makefile eledmac/examples

	cp $(PACKAGE) eledmac
	@$(RM) ../eledmac.zip
	zip -r ../eledmac.zip eledmac
	

clean:
	@$(RM) *.aux *.log *.out *.toc *tex *.pdf eledmac.sty eledpar.sty  *ind *ilg  *lof *idx *glo *gls ../eledmac.zip

