.PHONY:	main.pdf	all 	clean	
all:	main.pdf
%.tex: 	%.raw
	./raw2tex $< > $@	
%.tex:	 %.dat
	./dat2tex $< > $@		
main.pdf: main.tex
	latexmk	--verbose	-pdf 	-pdflatex="xelatex -interaction=nonstopmode	-shell-escape" 	-use-make 	main.tex	2>&1 | grep --color=auto -E ".*"
clean:
	latexmk	-CA	&& rm -rf {*.bbl,*.loa,*.backup,*.pytxcode,*.'gz(busy)',*.ptc,*.run.xml}

debug:	
	latexmk	--verbose	-pdf 	-pdflatex="xelatex  -shell-escape" 	-use-make 	main.tex	2>&1 | grep --color=auto -E ".*"
