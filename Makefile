MD = mkdir -p
DATA = master
XSL = xsl
W = www

.PHONY: all clean dtd xsd web tidy xq java

dtd:
	xmllint --valid --noout $(DATA).xml

xsd:

web:
	$(MD) $(W)
	xslproc $(XSL)/$(DATA).xsl $(DATA).xml

tidy:
	tidy -qe www/*.html

xq:

java:

all: dtd xsd web tidy xq java

clean:
	rm -vrf www
