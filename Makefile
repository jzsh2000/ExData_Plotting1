ZIP_FILE=exdata-data-household_power_consumption.zip

all: plot1.png plot2.png plot3.png plot4.png
plot1.png: plot1.R subset.txt
	./plot1.R subset.txt
plot2.png: plot2.R subset.txt
	./plot2.R subset.txt
plot3.png: plot3.R subset.txt
	./plot3.R subset.txt
plot4.png: plot4.R subset.txt
	./plot4.R subset.txt
subset.txt: filterData.sh
	./filterData.sh $(ZIP_FILE)
