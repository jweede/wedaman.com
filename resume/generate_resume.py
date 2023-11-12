#!/usr/bin/env python3
from datetime import datetime
import os

import jinja2
import yaml

HERE = os.path.dirname(os.path.realpath(__file__))
YAML_FILE = HERE + "/resume.yml"
OUTPUT_FILE = HERE + "/../_site/resume/index.html"


def generate_resume():
    with open(YAML_FILE) as fp:
        context = yaml.safe_load(fp)
    # skills = context["resume"]["Skills"]
    # for skillObj in skills:
    #     skillObj["list"] = ", ".join(skillObj["list"])

    env = jinja2.Environment(
        undefined=jinja2.StrictUndefined, loader=jinja2.FileSystemLoader(HERE)
    )
    env.globals["publish_date"] = datetime.now().isoformat(" ")
    env.globals.update(context)
    env.get_template("index.html").stream().dump(OUTPUT_FILE)


if __name__ == "__main__":
    generate_resume()
