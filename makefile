PACKAGE = *.dtx \
		  *.ins \
		  reledmac.pdf \
		  reledpar.pdf \
			migration.pdf \
		  README \
		  makefile \
		  latexmkrc \



.PHONY: all dist clean


all: reledmac.sty reledmac.pdf  reledpar.sty reledpar.pdf migration.pdf dist

doc: *.pdf

migration.pdf: migration.dtx
	xelatex -no-pdf $<
	xelatex -no-pdf $<
	xelatex -no-pdf $<
	xdvipdfmx migration.xdv

README: README.md
	pandoc README.md -o README

%.sty: %.ins %.dtx
	rm -f $*.sty 
	@pdflatex $*.ins

%.pdf: %.sty %.dtx
	@xelatex -no-pdf $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@xelatex -no-pdf $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@xelatex -no-pdf $*.dtx
	@xdvipdfmx $*.xdv

dist: $(PACKAGE) examples
	rm -rf reledmac
	mkdir reledmac
	@xelatex reledmac.dtx #We call it at last time because reledmac handbook can refer to page of reledpar handbook, and so we need to run reledmac.dtx a last time after reledpar.dtx has been run
	rm -f examples/*pdf
	$(MAKE) -C examples all
	mkdir reledmac/examples
	ln examples/latexmkrc reledmac/examples
	ln examples/*pdf reledmac/examples
	ln examples/*tex reledmac/examples
	ln examples/*xdy reledmac/examples
	ln examples/makefile reledmac/examples
	mkdir reledmac/doc-include
	ln doc-include/*dtx reledmac/doc-include
	ln $(PACKAGE) reledmac
	@$(RM) ../reledmac.zip
	zip -r ../reledmac.zip reledmac


clean:
	$(MAKE) -C examples clean
	@$(RM) *xdv *.aux *.log *.out *.toc *tex *.pdf reledmac.sty reledpar.sty  *ind *ilg  *lof *idx *glo *gls ../reledmac.zip
