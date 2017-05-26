# LogVoyage documentation

##Usage

To start working with docs you wiil need to mkdocs docker image
https://hub.docker.com/r/squidfunk/mkdocs-material/
```
docker pull squidfunk/mkdocs-material
```

## Development
Start development server on http://localhost:8000

```
docker run --rm -it -p 8000:8000 -v `pwd`:/docs squidfunk/mkdocs-material
```

Build documentation

```
docker run --rm -it -v `pwd`:/docs squidfunk/mkdocs-material build
```

For detailed installation instructions and a demo, visit
http://squidfunk.github.io/mkdocs-material/
