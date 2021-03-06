SHELL := bash

.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles: ## Install all the dotfiles
		for file in $(shell find $(CURDIR) ! -path "*.vim*" \( -name ".*" -o -name "Brewfile" \) -not -name ".gitignore" -not -name ".git" -not -name ".config" -not -name ".github" -not -name ".*.swp" -not -name ".gnupg"); do\
			f=$$(basename $$file); \
			ln -sfn $$file $(HOME)/$$f; \
		done; \
		gpg --list-keys || true;
		mkdir -p $(HOME)/{.vim/{backups,bundle,swap,undo},.gnupg}
		for file in $(shell find $(CURDIR)/.gnupg); do \
			f=$$(basename $$file); \
			ln -sfn $$file $(HOME)/.gnupg/$$f; \
		done; \
		for file in $(shell find $(CURDIR)/.vim ! -path "*.vim/backups*" ! -path "*.vim/bundle*" ! -path "*.vim/swap*" ! -path "*.vim/undo*" -not -name ".vim"); do \
			f=$$(basename $$file); \
			ln -sfn $$file $(HOME)/.vim/$$f; \
		done; \

.PHONY: test
test: shellcheck ## Run all the tests on the files in this repo

.PHONY: shellcheck
shellcheck: ## Run shellcheck tests against scripts
		docker run --rm -i $(DOCKER_FLAGS) \
			--name df-shellcheck \
			-v $(CURDIR):/usr/src:ro \
			--workdir /usr/src \
			r.j3ss.co/shellcheck ./test.sh

.PHONY: help
help:
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
