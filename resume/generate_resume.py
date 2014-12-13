import pystache, yaml

YAML_FILE='resume.yml'
TEMPLATE_FILE='index.html'
OUTPUT_FILE='../_site/resume/index.html'

context = yaml.load(open(YAML_FILE))

skills = context["resume"]["Skills"]
for skillObj in skills:
    skillObj["list"] = ', '.join( skillObj["list"] )

with open(OUTPUT_FILE,'w') as ff:
    ff.write( pystache.render(open(TEMPLATE_FILE).read(), context) )

