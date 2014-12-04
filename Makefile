# Simple Makefile
.SILENT: 

prereq: 
	mkdir -p _site
	mkdir -p _site/resume
	mkdir -p _site/css

build: prereq
	# generate index
	pandoc -f markdown -t html5 -o ./_site/index.html ./index.md;
	cd ./resume && python generate_resume.py
	cp keybase.txt ./_site/
	# less -> css
	lessc ./less/default.less ./_site/css/default.css
	lessc ./less/resume.less ./_site/css/resume.css
	# other resources
	cp ./favicon.ico ./_site/
	echo "-*- Site Generated -*-";

publish: build
	echo "-*-  Publishing... -*-";
	s3cmd sync _site/ s3://wedaman.com/
	echo "-*- We'll do it live! -*-";

# convenience target
serve: build
	cd ./_site && python -m SimpleHTTPServer

all: publish

# also unneccesary
clean:
	rm -r ./_site
