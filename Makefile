RSCRIPT=/usr/local/bin/Rscript

all: $(patsubst %.Rmd, html/%.html, $(wildcard *.Rmd)) 

html/%.html: %.Rmd config/styles.css
	$(RSCRIPT) -e "library(knitr); rmarkdown::render(\"$*.Rmd\",output_file=\"html/$*.html\", params=list(key=FALSE)); rmarkdown::render(\"$*.Rmd\",output_file=\"key/$*_key.html\");"