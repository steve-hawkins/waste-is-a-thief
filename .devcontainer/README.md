# Dev Container

This dev container is configured to use the official Jekyll dev container image. It will also install the Gemini CLI.

## Usage

1. Open this project in the dev container.
2. The `postCreateScript.sh` will install the Gemini CLI and all Jekyll dependencies.
3. To start the Jekyll server, run the following command in the terminal:

```bash
bundle exec jekyll serve --baseurl=""
```
