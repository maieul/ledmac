PACKAGE = *.dtx \
		  *.ins \
		  ledmac1.pdf \
		  ledpar1.pdf \
		  *eps \
		  README \
		  Makefile



.PHONY: all dist clean


all: ledmac1.sty ledmac1.pdf ledpar1.sty ledpar1.pdf dist

doc: *.pdf


%.sty: %.ins %.dtx 
	rm -f $*.sty led*tex
	@pdflatex $*.ins

%.pdf: %.sty %.dtx djd17novL.eps djdpoems3.eps ledarden.eps ledfeat.eps djd17novR.eps djdpoems4.eps ledbraonain.eps ledioc.eps djdpoems1.eps ledeasy.eps ledmixed.eps djdpoems2.eps ledekker.eps villon.eps
	@pdflatex $*.dtx
	@makeindex -s gind.ist -o $*.ind $*.idx
	@makeindex -s gglo.ist -o $*.gls $*.glo
	@pdflatex $*.dtx
	@pdflatex $*.dtx


dist: $(PACKAGE)
	@$(RM) ../ledmac1.zip
	zip ../ledmac1.zip $(PACKAGE)
	

clean:
	@$(RM) *.aux *.log *.out *.toc *tex *.pdf ledmac1.sty ledarab1.sty ledpar1.sty afoot.sty *ind *ilg  *lof *idx *glo *gls ../ledmac1.zip

