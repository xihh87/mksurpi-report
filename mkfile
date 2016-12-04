all:V:
	mk pathogens gi

pathogens:V:
	./targets_pathogens | xargs mk

gi:V:
	./targets_gi | xargs mk

'results/%.gi':	'data/%.sam'
	mkdir -p `dirname "$target"`
	./extract_gi "$prereq" \
	| sort -V \
		--ignore-case \
	| ./tab-uniqc \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"

'results/%.pathogens':	'data/%.sam'
	mkdir -p `dirname "$target"`
	./extract_filogeny "$prereq" \
	| ./filogeny2tsv \
	| sort -V \
		--ignore-case \
	| ./tab-uniqc \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"
