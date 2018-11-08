# Simple Makefile
DIST := _site
DIRS := $(DIST) $(DIST)/resume $(DIST)/css
COPIED := keybase.txt favicon.ico
LESS := $(wildcard less/*.less)

$(DIRS):
	mkdir -p $@

$(COPIED): $(DIST)
	cp -l $@ ./$(DIST)/

$(DIST)/index.html: index.md $(DIST)
	pandoc -f markdown -t html5 -o ./$(DIST)/index.html ./index.md

$(DIST)/resume/index.html: $(DIST)/resume/%.%
	./resume/generate_resume.py

$(DIST)/css/%.css: $(DIST)/css less/%.less
	lessc less/$(pathsubst %.css,%.less,$(notdir $@)) $@

.PHONY: build
build: $(DIRS) $(DIST)/index.html \
		$(addprefix $(DIST)/,$(COPIED)) \
		$(addprefix $(DIST)/css/,$(pathsubst %.less,%.css,$(notdir $(LESS))))
	echo "-*- Site Generated -*-";

.PHONY: publish
publish: build
	echo "-*-  Publishing... -*-";
	aws s3 sync --delete _site/ s3://wedaman.com/
	echo "-*- We'll do it live! -*-";

# convenience target
.PHONY: serve
serve: build
	cd ./_site && python -m SimpleHTTPServer

.PHONY: all
all: publish

# also unneccesary
.PHONY: clean
clean:
	rm -r ./_site
