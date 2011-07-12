PACKAGE = *.dtx \
		  *.ins \
		  ledmac.pdf \
		  ledarab.pdf \
		  ledpar.pdf \
		  *eps \
		  *patch.sty \
		  README \
		  Makefile

EPS = djd17novL.eps djdpoems3.eps ledarden.eps ledfeat.eps djd17novR.eps  djdpoems4.eps  ledbraonain.eps  ledioc.eps  djdpoems1.eps  egarab.eps  ledeasy.eps  ledmixed.eps   djdpoems2.eps  egarabpar.eps  ledekker.eps  villon.eps

.PHONY: all doc dist clean cleanall


all: ledmac.sty ledmac.pdf ledpar.sty ledpar.pdf ledarab.sty ledarab.pdf

doc: *.pdf

%.sty: %.ins %.dtx 
	pdflatex $*.ins

%.pdf: %.ins %.dtx $(EPS)
	pdflatex $*.dtx


dist: $(PACKAGE)
	@$(RM) ledmac.zip
	@zip ledmac.zip $(PACKAGE)

clean:
	@$(RM) *.aux *.log *.out *.toc *tex

cleanall: clean
	@$(RM) ledmac.sty ledpar.sty ledarab.sty *.zip
