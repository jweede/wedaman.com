build: 
	@jekyll --no-auto
	@echo "-*- Site Generated -*-";

publish: build
	@echo "-*-  Publishing... -*-";
	rsync -avz \
	  --delete \
	  --exclude="lavergne.gotdns.org/" \
	  --exclude="cgi-bin/" \
	  --exclude=".htaccess" \
	  ./_site/ wedaman@wedaman.com:public_html/;

# convenience target
serve:
	@jekyll --server

all: publish

# also unneccesary
clean:
	rm -r ./_site