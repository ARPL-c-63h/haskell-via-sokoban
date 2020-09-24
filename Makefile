all: haskell-via-sokoban.html

SHELL=/bin/bash

haskell-via-sokoban.md: $(sort $(wildcard 0*.md))
	rm -f $@
	cat $^ > $@
	chmod -w $@

haskell-via-sokoban.html: haskell-via-sokoban.md pandoc.css solution.css solution.js inline-code.css
	./pandoc \
	  --toc \
	  --toc-depth 2 \
	  --number-sections \
	  --section-divs \
	  --standalone \
	  --include-in-header solution.js \
	  --css pandoc.css \
	  --css solution.css \
	  --css inline-code.css \
	  --filter ./label-exercises \
	  --write=html5 \
	  -V lang=en-US \
	  $< -o $@


# files: haskell-via-sokoban.md write-files
#	rm -rf files
#	mkdir files
#	./pandoc -t json $< | ./write-files
#	cd files; tree -H '.' -L 1 --noreport --charset utf-8 > index.html
