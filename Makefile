# um Makefile bastante simplificado
all: dvi
	dvipdfm dissertacao
dvi: bib
	latex dissertacao.tex
pdf: bib
	dvipdfm dissertacao
ps: bib
	latex dissertacao.tex
	dvips -t a4 -o dissertacao.ps dissertacao.dvi
pspdf: bib ps
	ps2pdf dissertacao.ps
all: pdf
bib: dissertacao.tex
	latex $<
	bibtex dissertacao
	latex $<
clean:
	rm -f *.bbl *.aux *.log *.toc *.blg *.idx *.lof *.lot dissertacao.pdf dissertacao.dvi dissertacao.ps *~ ./texto/*.aux ./texto/*.log

