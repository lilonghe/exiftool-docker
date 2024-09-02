

## Build
```
docker build -t exiftool .
```

## Run
```
docker run -it --rm -v $(pwd):/app exiftool image-name.jpg
```

## References
- https://exiftool.org/install.html