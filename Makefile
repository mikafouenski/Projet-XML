MD = mkdir -p
DATA = master
XSL = xsl
W = www

.PHONY: all clean dtd xsd web tidy xq java

dtd:
	xmllint --valid --noout $(DATA).xml

xsd:
	echo -e "TODO"

web:
	$(MD) $(W) && \
	java -cp saxon/saxon9he.jar net.sf.saxon.Transform -xsl:$(XSL)/$(DATA).xsl $(DATA).xml

tidy:
	tidy -qe www/index.html
	tidy -qe www/*/*.html

xq:
	echo -e "TODO"

java:
	echo -e "TODO"

all: dtd xsd web tidy xq java

clean:
	rm -rf www
