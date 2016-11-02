
dicts = $(sort $(dir $(wildcard */)))

all: $(dicts)

$(dicts):
	$(MAKE) -C $@

.PHONY: all $(dicts)
