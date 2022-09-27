# Development on documentation

## tl;dr

**You will need to use following `npm scripts` before creating a pull request!**

1. `npm install`
2. `npm test`

## Features

* Linting of markdown documents
* Link checking

## Specifications

This repository checks against following specification:

* [Markdown Commonmark](https://spec.commonmark.org/)

## Prerequisites

Install the Node.js 16 Active LTS version of [Node.js](https://nodejs.org/en/) (which includes npm).

## Installation

For linting and all the checks you need several npm packages. The following command installs all necessary npm dependencies:

```shell
npm install
```

This installs all dependencies into a local `node_modules` folder.

## Checks

To enforce specification conformity there are several checks defined as `npm run-script` targets. To run all checks please execute:

```shell
npm test
```

### Individual checks

If you want to run individual checks see the targets and the description below.
Every individual check can be run like so:

```shell
npm run-script my-individual-check
```

See the [package.json](package.json) file for the currently available scripts.

#### Markdown linter

Markdown linting. See the rules [here](https://github.com/DavidAnson/markdownlint).

```shell
npm run-script markdownlint
```

##### Markdown linter overrides

Sometimes it is not possible to be commonmark conform. In these rare cases an inline tag to skip linting is possible.

Candidates are tables.

```html
<!-- markdownlint-disable-->
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
<!-- markdownlint-enable-->
```

Additionally HTML image tags can be allowed globally. This is useful if you need
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

#### Link resolver

All cross references and external URLs are resolved.

```shell
npm run-script checklinks
```

#### Inconsiderate language scanner

This checks against profanity and inconsiderate language. This is helpful for
non-natives to detect words that could be inconsiderate. This utilizes [alex](https://github.com/get-alex/alex)

```shell
npm run-script detect-inconsiderate-language
```
