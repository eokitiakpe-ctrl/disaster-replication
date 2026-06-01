.PHONY: all clean

all:
	"/c/Program Files/R/R-4.3.2/bin/Rscript.exe" code/preprocess.R
	"/c/Program Files/R/R-4.3.2/bin/Rscript.exe" code/analysis.R

clean:
	rm -f temp/*.csv
	rm -f output/figures/*.png
	rm -f output/tables/*.tex