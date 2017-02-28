MD = mkdir -p
DATA = master
XSL = xsl
W = www

.PHONY: all clean dtd xsd web tidy xq java

donneetomaster:
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/donneetomaster.xsl donnees-master/donnees-master.xml

dtd: donneetomaster
	xmllint --valid --noout $(DATA).xml

xsd: donneetomaster
	echo -e "TODO"

web: donneetomaster
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/$(DATA).xsl $(DATA).xml

tidy:
	tidy -qe www/index.html
	tidy -qe www/*/*.html

xq: donneetomaster
	java -cp saxon/saxon9he.jar net.sf.saxon.Query -q:xq.txt -o:www/test.html

java: donneetomaster
	echo -e "TODO"

all: dtd xsd web tidy xq java

clean:
	rm -rf www
