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
	cd $(W) && \
	saxon -xsl:../$(XSL)/$(DATA).xsl ../$(DATA).xml

tidy:
	tidy -e www/*.html

xq:
	echo -e "TODO"

java:
	echo -e "TODO"

all: dtd xsd web tidy xq java

clean:
	rm -vrf www
