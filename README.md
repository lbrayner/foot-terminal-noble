Build `foot`:

```bash
docker build -t foot-terminal-noble .
```

Install `foot`:

```bash
docker run -it --rm -v /:/destdir foot-terminal-noble bash -c \
    'cd /foot && DESTDIR=/destdir meson install -C build'
```

Install `foot-terminfo`:

```bash
sudo apt install foot-terminfo
```
