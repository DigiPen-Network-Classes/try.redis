Try Redis
=========

A sandboxed tutorial of Redis. Uses an actual redis server and namespaces to keep sessions from seeing each other's edits.

# Running Locally

## pull and run

Pull the image from the Docker repository 
```bash
docker pull trasa/try-redis:latest
```

Then run it; use `--rm` to indicate that docker should clean up when the container terminates:

```bash
docker run -d --name try-redis --rm -p 4567:4567 trasa/try-redis:latest
```

[Then start the tutorial](http://127.0.0.1:4567/)


## stopping

Terminating the container takes about 10-15 seconds:

```bash
docker stop try-redis
```

# History

This project was started by [@alexmchale](https://github.com/alexmchale/) back in 2010.

In January 2013, [@badboy](https://github.com/badboy/) aka Jan-Erik Rediger took over the maintenance and ran it on a server: 
[Try Redis](http://try.redis.io) is a demonstration of the Redis data structure server.

The site and the codebase was declared unmaintained since March 2018.

I was using that server to introduce students to Redis but the server is no longer hosted there, presumably due to security vulnerabilities.
I added enough functionality to run the code as a Docker image, I am not planning to fix or upgrade any vulnerabilities so be careful
if you are hosting this on a public network!

