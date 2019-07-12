# Simple Makefile
DIST := _site
DIRS := $(DIST) $(DIST)/resume $(DIST)/css
COPIED := keybase.txt favicon.ico
COPIED_DIST := $(addprefix $(DIST)/,$(COPIED))
LESS := $(wildcard less/*.less)

$(DIRS):
	mkdir -p $@

.PHONY: build
build: $(DIRS)
	cp -l $(COPIED) ./$(DIST)/
	pandoc -f markdown -t html5 -o ./$(DIST)/index.html ./index.md
	python3 ./resume/generate_resume.py
	lessc less/default.less _site/css/default.css
	lessc less/resume.less _site/css/resume.css
	echo "-*- Site Generated -*-";

.PHONY: publish
publish: build
	echo "-*-  Publishing... -*-";
	aws --profile=personal s3 sync --delete _site/ s3://wedaman.com/
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
	rm -rf ./_site
