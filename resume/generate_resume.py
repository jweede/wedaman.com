import pystache, yaml

YAML_FILE='resume.yaml'
TEMPLATE_FILE='index.html'
OUTPUT_FILE='../_site/resume/index.html'


def list_english_join( ll ):
	if len(ll) == 2:
		return ' and '.join(ll)
	elif len(ll) > 2:
		last = ll.pop()
		return ', '.join(ll) + ', and ' + last
	else:
		return ''.join(ll)

context = yaml.load(open(YAML_FILE))

context["resume"]["Skills"]["Platforms"] = list_english_join( context["resume"]["Skills"]["Platforms"] )
context["resume"]["Skills"]["Languages"] = list_english_join( context["resume"]["Skills"]["Languages"] )

with open(OUTPUT_FILE,'w') as ff:
    ff.write( pystache.render(open(TEMPLATE_FILE).read(), context) )

