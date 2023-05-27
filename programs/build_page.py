from glob import glob
from pathlib import Path


def generate_html_audio_player(filepath):
    stem = Path(filepath).stem
    name = Path(filepath).name

    html = """
<figure>
    <figcaption>{stem}</figcaption>
    <audio controls src="{name}"></audio>
</figure>
""".format(stem = stem, name = name)

    return html


def read_file(path):
    with open(path, encoding="utf-8") as f:
        content = f.read()

    return content


if __name__ == "__main__":
    files = sorted(glob("output/*.mp3"))
    html_players = [generate_html_audio_player(filepath) for filepath in files]
    html_players = "\n".join([html for html in html_players])

    # work around pypandoc errors with -H option
    text = \
        read_file("programs/header.html") \
        + html_players \
        + read_file("programs/footer.html")

    with open("output/index.html", "w") as f:
        f.write(text)
