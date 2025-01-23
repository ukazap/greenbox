MANIFEST_DIR := $(shell pwd)
HOME_DIR := $(MANIFEST_DIR)/home

.PHONY: enter

enter:
	@distrobox enter greenbox

distrobox.ini:
	@echo "[greenbox]" > $@
	@echo "image=registry.fedoraproject.org/fedora-toolbox:40" >> $@
	@echo "init=true" >> $@
	@echo "nvidia=true" >> $@
	@echo "root=false" >> $@
	@echo "start_now=true" >> $@
	@echo "home=$(HOME_DIR)" >> $@

setup: distrobox.ini
	@mkdir -p $(HOME_DIR)
	@distrobox assemble create

clean:
	@rm -f distrobox.ini
