BASEDIR ?= ..
xsldir ?= $(BASEDIR)/xsl
dictname ?= $(shell basename "$(shell pwd)")

DICTFMTFLAGS += --utf8
XSLTPROCESSOR ?= xsltproc -novalid

SHELL=bash

date=$(shell date +%G-%m-%d)

empty:=
space:= $(empty) $(empty)
version1 := $(shell sed -e '100q;/<edition>/!d;s/.*<edition>\(.*\)<\/edition>.*/\1/;q'\
	   $(wildcard $(dictname).tei*))
version := $(subst $(space),_,$(version1))

all:
	$(MAKE) dict

$(dictname).c5: $(dictname).tei $(xsldir)/tei2c5.xsl \
	$(xsldir)/inc/teientry2txt.xsl \
	$(xsldir)/inc/teiheader2txt.xsl \
	$(xsldir)/inc/indent.xsl
	$(XSLTPROCESSOR) --xinclude --stringparam current-date $(date) $(xsldir)/tei2c5.xsl $< >$@

%.dict %.index: %.c5
	dictfmt -t --headword-separator %%% $(DICTFMTFLAGS) $* <$<

%.dz: %
	dictzip -k $<

%.tar.gz: %.dict.dz %.index
	tar czf $*.tar.gz $*.dict.dz $*.index

dict: $(dictname).tar.gz

clean:
	rm -f $(dictname).index $(dictname).dict
	rm -f $(dictname).c5 $(dictname).dict.dz

# .DELETE_ON_ERROR:

.PHONY: all clean
