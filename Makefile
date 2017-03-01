MD = mkdir -p
DATA = master
XSL = xsl
W = www

.PHONY: all clean dtd xsd web tidy xq java

all: donneetomaster dtd xsd web tidy xq java

donneetomaster:
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/donneetomaster.xsl donnees-master/donnees-master.xml

dtd:
	xmllint --valid --noout $(DATA).xml

xsd:
	xmllint --valid --noout --schema $(DATA).xsd $(DATA).xml

web:
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/$(DATA).xsl $(DATA).xml

tidy:
	- tidy -qe www/index.html
	- tidy -qe www/*/*.html

xq:
	java -cp saxon/saxon9he.jar net.sf.saxon.Query -q:xq.txt -o:www/xq.html

java:
	cd java && \
	javac *.java && \
	java Sax ../$(DATA).xml && \
	echo -e "\n\nCi dessus Sax\n" && \
	sleep 5 && \
	java Dom ../$(DATA).xml && \
	echo -e "\n\nCi dessus Dom\n"

clean:
	rm -rf www
	rm -rf java/*.class
