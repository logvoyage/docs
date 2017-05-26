serve:
	@docker run --rm -it -p 8000:8000 -v `pwd`:/docs squidfunk/mkdocs-material

build:
	@docker run --rm -it -v `pwd`:/docs squidfunk/mkdocs-material build

.PHONY: serve build
