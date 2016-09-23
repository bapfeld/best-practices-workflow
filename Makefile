BIB = $(HOME)/Dropbox/bibliography/references.bib

all: pdf odt presentation

pdf: output/awesome-paper.pdf

odt: output/awesome-paper.odt

# Make the presentation
presentation: presentation/best-practices-presentation.pdf

presentation/best-practices-presentation.pdf: presentation/best-practices-presentation.tex
	cd presentation; latexmk -synctex=1 -shell-escape -xelatex -pdf -output-directory=../output best-practices-presentation

# make the pdf 
output/awesome-paper.pdf: output/awesome-paper.tex
	latexmk -synctex=1 -shell-escape -pdf -output-directory=output output/awesome-paper

# make the odt (can then save to docx if really need it)
# can also make docx directly by changing odt to docx in following lines
# Not everything will be perfect - it will need some manual editing
output/awesome-paper.odt: output/awesome-paper.tex
	pandoc -S --bibliography=$(BIB) -o output/awesome-paper.odt output/awesome-paper.tex

# knit the Rnw document to a tex document in preparation for compilation
output/awesome-paper.tex: awesome-paper.Rnw data/beer-data.csv
	Rscript -e 'if(!dir.exists("output/")){dir.create("output/")}'
	Rscript -e 'knitr::knit("awesome-paper.Rnw", output = "output/awesome-paper.tex")'

# Go get the data
data/beer-data.csv: code/beer-data.R code/packages.R
	cd code; Rscript -e 'source("beer-data.R")'

# clean up after yourself
clean:
	rm -rfv output/ *.aux *.log \
	*.toc *.blg *.bbl *.synctex.gz *.out *.bcf *blx.bib \
	*.run.xml *.fdb_latexmk *.fls

PHONY: all pdf odt presentation clean 
