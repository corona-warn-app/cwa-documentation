.PHONY: all install check markdownlint clean checklinks spellcheck-en spellcheck detect-inconsiderate-language

SHELL := /bin/bash
export PATH := ./node_modules/.bin:$(PATH)

install:
	# https://stackoverflow.com/a/56254478
	npm ci

check: markdownlint checklinks spellcheck format-spelling detect-inconsiderate-language
spellcheck: spellcheck-en

spellcheck-en:
	mdspell '**/*.md' --en-us -t -n -a --report \
	'!**/node_modules/**/*.md' \
	'!**/.github/**/*.md' \
	'!**/translations/**/*.md'

markdownlint:
	markdownlint '**/*.md' --ignore node_modules

checklinks:
	# https://github.com/tcort/markdown-link-check/issues/57
	find . -not -path "*node_modules*" -not -path "*.github*" -name \*.md | \
	xargs -n 1 markdown-link-check

detect-inconsiderate-language:
	alex

format-spelling:
	sort < .spelling | sort | uniq | tee .spelling.tmp > /dev/null && mv .spelling.tmp .spelling

clean:
	rm -rf node_modules
