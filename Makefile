MD = mkdir -p
DATA = master
XSL = xsl
W = www

.PHONY: all clean dtd xsd web tidy xq java

all: donneetomaster dtd xsd web tidy xq java display

display:
	echo -e "\n\n Toutes les sorties \"longues\" se trouve dans le dossier out."

out_folder:
	$(MD) out

donneetomaster:
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/donneetomaster.xsl donnees-master/donnees-master.xml

dtd:
	xmllint --valid --noout $(DATA)/$(DATA).xml

xsd:
	xmllint --valid --noout --schema $(DATA)/$(DATA).xsd $(DATA)/$(DATA).xml

web:
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/$(DATA).xsl $(DATA)/$(DATA).xml

tidy:
	- tidy -qe www/index.html
	- tidy -qe www/*/*.html

xq:
	java -cp saxon/saxon9he.jar net.sf.saxon.Query -q:xq.txt -o:www/xq.html

java: out_folder
	cd java && \
	javac *.java && \
	java Sax ../$(DATA)/$(DATA).xml > out/Sax.txt && \
	java Dom ../$(DATA)/$(DATA).xml > out/Dom.txt

test:
	./tester.sh

clean:
	rm -rf www
	rm -rf java/*.class
	rm -rf out
