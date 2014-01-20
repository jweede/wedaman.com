# Simple Makefile
.SILENT: 

prereq: 
	mkdir -p _site
	mkdir -p _site/resume
	mkdir -p _site/css

build: prereq
	# generate index
	pandoc -f markdown -t html5 -o ./_site/index.html ./index.md;
	pandoc -f markdown -t html5 -o ./_site/resume/index.html resume.md;
	# less -> css
	lessc ./less/default.less ./_site/css/default.css
	lessc ./less/resume.less ./_site/css/resume.css
	# other resources
	cp ./favicon.ico ./_site/
	echo "-*- Site Generated -*-";

publish: build
	echo "-*-  Publishing... -*-";
	echo "-*-  ...Not Really -*-";
	#rsync -avz \
	#  --delete \
	#  --exclude="lavergne.gotdns.org/" \
	#  --exclude="cgi-bin/" \
	#  --exclude=".htaccess" \
	#  ./_site/ wedaman@wedaman.com:public_html/;
	echo "-*- We'll do it live! -*-";

# convenience target
serve: build
	cd ./_site && python -m SimpleHTTPServer

all: publish

# also unneccesary
clean:
	rm -r ./_site
