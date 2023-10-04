RSCRIPT=/usr/local/bin/Rscript

all: $(patsubst Rmd/%.Rmd, html/%.html, $(wildcard Rmd/*.Rmd)) 

%.html: Rmd/%.Rmd config/styles.css
	$(RSCRIPT) -e "library(knitr); library(rmarkdown); rmarkdown::render(\"Rmd/$*.Rmd\",output_file=\"$*.html\", params=list(key=FALSE)); rmarkdown::render(\"Rmd/$*.Rmd\",output_file=\"key/$*_key.html\");"
	rm Rmd/table1.html