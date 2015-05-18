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
	pandoc README.md -o README

%.sty: %.ins %.dtx 
	rm -f $*.sty $*tex
	@pdflatex $*.ins

%.pdf: %.sty %.dtx 
	@xelatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@xelatex $*.dtx
	@xelatex $*.dtx


dist: $(PACKAGE) examples
	rm -rf eledmac
	mkdir eledmac
	mkdir eledmac/examples
	$(MAKE) -C examples all
	ln examples/*pdf eledmac/examples
	ln examples/*tex eledmac/examples
	ln examples/*xdy eledmac/examples
	ln examples/makefile eledmac/examples

	ln $(PACKAGE) eledmac
	@$(RM) ../eledmac.zip
	zip -r ../eledmac.zip eledmac
	

clean:
	$(MAKE) -C examples clean
	@$(RM) *.aux *.log *.out *.toc *tex *.pdf eledmac.sty eledpar.sty  *ind *ilg  *lof *idx *glo *gls ../eledmac.zip

