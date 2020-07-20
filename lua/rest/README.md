# How to run

Build and start

```
docker build -t hello-lua .
docker run -p 8080:8080 hello-lua
```

Test it

```
curl http://localhost:8080/hello
```

