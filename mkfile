'results/%.pathogens':	'data/%.sam'
	mkdir -p `dirname "$target"`
	./extract_filogeny "$prereq" \
	| ./filogeny2tsv \
	| sort -V \
		--ignore-case \
	| ./tab-uniqc \
	> "$target"'.build' \
	&& mv "$target"'.build' "$target"
