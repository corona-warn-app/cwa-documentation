# Development on documentation

## tl;dr

**You will need to use following `make targets` before creating a pull request!**

1. `make install`
2. `make check`

## Features

* Linting of markdown documents
* Spell checking
* Link checking

## Specifications

This repository checks against following specification:

* [Markdown Commonmark](https://spec.commonmark.org/)

### Languages

Supported languages are:

* [English US](https://en.wikipedia.org/wiki/ISO/IEC_8859-1)

## Prerequisites

To run all the linters please install for your OS:

* [npm](https://github.com/nodesource/distributions)

## Installation

For linting and all the checks you need several npm packages. The following
command installs all necessary npm dependencies:

```shell
make install
```

This installs all dependencies into a local `node_modules` folder. `Make` adds
this to your execution path automatically. If you install the modules somewhere
else please make sure this folder is in your execution path. On macOS or Linux
you probably need to export your Path like this:

```shell
export PATH=my/path/to/node_modules/.bin:$PATH
```

## Checks

To enforce good spelling and specification conformity there are several checks
as `Makefile` targets defined. To run all checks please execute:

```shell
make check
```

As an alternative to make it is possible to utilize *npm-run-all* for testing:

```shell
npm run-script test
```

### Individual checks

If you want to run individual checks see the targets and the description below.
There are always Makefile targets. If you prefer npm for testing you can run
every individual check like so:

```shell
npm runscript my-individual-check
```
See the package-json file for help.

#### Markdown linter

Markdown linting. See the rules [here](https://github.com/DavidAnson/markdownlint).

```shell
make markdownlint
```

##### Overrides

Sometimes it is not possible to be commonmark conform. In this
rare cases an inline tag to skip linting is possible.

Candidates are tables.

```html
<!-- markdownlint-disable-->
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
<!-- markdownlint-enable-->
```

Additionally html image tags can be allowed globally. This is useful if you need
to resize images, since commonmark has no annotation for this.

This is done with a .markdownlint.json override file which would look something
like this:

```json
{
    "no-inline-html": {
        "allowed_elements": [
            "img",
            "table"
        ]
    }
}
```

For more information how to tweak overrides consult the markdown linter
documentation mentioned above.

#### Spell checker

##### English

Spell checking in American English (en_US).

```shell
make spellcheck-en
```

##### German

Not implemented yet.

##### Overrides

Add any additional words to the .spelling file and use the make target to sort
and clean them before adding these to master.

```shell
make format-spelling
```

Please note sometimes overriding is not the way to go. For example there may be
three ways for the word TeleTan (TeleTAN, teleTAN) in this repository. The
documents should stick to one variation.

#### Link resolver

All cross references and external URLs are resolved.

```shell
make checklinks
```

#### Inconsiderate language scanner

This checks against profanity and inconsiderate language. This is help full for
non-natives to detect words that could be inconsiderate. This utilizes
[alex](https://github.com/get-alex/alex)

```shell
make detect-inconsiderate-language
```
