#!/usr/bin/env python3
from pathlib import Path
import shutil
import jinja2
import yaml

here = Path(__file__).parent.resolve()

output_dir = here / "../_site/wishlist/"
output_path = output_dir / "index.html"

jenv = jinja2.Environment(
    loader=jinja2.FileSystemLoader(Path(here)),
    undefined=jinja2.StrictUndefined,
)

with here.joinpath("wishlist.yml").open() as fp:
    conf = yaml.safe_load(fp)


sections = conf["sections"]
cards = conf["cards"]


def get_cards_with_sec_id(sec_id: str):
    for card in cards:
        card.setdefault("hide", False)
        
        card_sec_id = card.get("sec")
        if card_sec_id is None:
            print("-- card has no section id!! --")
            print(card)
            print("-----")
            continue
        elif sec_id == card_sec_id:
            yield card

jenv.globals["get_cards_with_sec_id"] = get_cards_with_sec_id

output_dir.mkdir(exist_ok=True)
with output_path.open("wb") as fp:
    jenv.get_template("index.html.j2").stream(sections=sections, cards=cards).dump(fp, encoding="utf-8")

for media_path in here.joinpath("media").glob("*.*"):
    shutil.copy2(media_path, output_dir)