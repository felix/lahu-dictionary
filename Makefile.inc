
DICTFMTFLAGS += --utf8
XSLTPROCESSOR ?= xsltproc -novalid

formats = dictd stardict

all: $(formats)

sorted.xdxf: dict.xdxf $(basedir)/sort.xsl
	$(XSLTPROCESSOR) $(basedir)/sort.xsl $< >$@

$(formats): sorted.xdxf
	makedict -o $@ -i xdxf ../$(dictname)/sorted.xdxf

%.tar.gz: %.dict.dz %.index
	tar czf $*.tar.gz $*.dict.dz $*.index

clean:
	find . -name 'sorted.xdxf' -delete

.DELETE_ON_ERROR:

.PHONY: all clean

# vim: ft=make :
