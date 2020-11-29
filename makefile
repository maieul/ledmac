PACKAGE = *.dtx \
			*.ins \
		  reledmac.pdf \
		  reledpar.pdf \
			migration.pdf \
		  README.md \
		  makefile \
		  latexmkrc \



.PHONY: all dist clean doc test


all: test reledmac.sty reledpar.sty reledmac.pdf   reledpar.pdf migration.pdf dist

doc: *.pdf

test: *dtx
	l3build check -H --show-log-on-error

migration.pdf: migration.dtx
	pdflatex  $<
	pdflatex  $<
	pdflatex  $<

%.sty: %.ins %.dtx
	rm -f $*.sty
	@pdflatex $*.ins

%.pdf: %.sty %.dtx
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@pdflatex  $*.dtx

dist: $(PACKAGE) examples
	rm -rf reledmac
	mkdir reledmac
	@pdflatex reledmac.dtx #We call it at last time because reledmac handbook can refer to page of reledpar handbook, and so we need to run reledmac.dtx a last time after reledpar.dtx has been run
	rm -f examples/*pdf
	$(MAKE) -C examples all
	mkdir reledmac/examples
	ln examples/*pdf reledmac/examples
	ln examples/*tex reledmac/examples
	ln examples/*xdy reledmac/examples
	ln examples/makefile reledmac/examples
	ln examples/latexmkrc reledmac/examples
	mkdir reledmac/doc-include
	ln doc-include/*dtx reledmac/doc-include
	$(MAKE) -C doc-more all
	mkdir reledmac/doc-more
	ln doc-more/*pdf reledmac/doc-more
	ln doc-more/*tex reledmac/doc-more
	ln doc-more/makefile reledmac/doc-more
	ln doc-more/latexmkrc reledmac/doc-more
	ln $(PACKAGE) reledmac
	rm -rf build
	@$(RM) ../reledmac.zip
	zip -r ../reledmac.zip reledmac


clean:
	$(MAKE) -C examples clean
	@$(RM) *xdv *.aux *.log *.out *.toc *tex *.pdf reledmac.sty reledpar.sty  *ind *ilg  *lof *idx *glo *gls ../reledmac.zip
