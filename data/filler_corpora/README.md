# Semantic filler corpora

Text used by the `LB` (prose) and `KB` (code) filler arms in `src/nf/prompts.py`: content that carries real semantic
meaning but is unrelated to any task in this repo. Each prompt takes a contiguous excerpt of ~k o200k tokens starting
at a line boundary chosen deterministically from the problem id, so different problems see different excerpts and
re-runs see the same one.

| file | contents | source / licence |
|---|---|---|
| `prose.txt` | Jane Austen, *Pride and Prejudice* (1813), body text only | Project Gutenberg #1342, public domain (Gutenberg header/footer removed) |
| `code.txt` | CPython 3.12 `Lib/textwrap.py` and `Lib/json/decoder.py` | PSF licence |
