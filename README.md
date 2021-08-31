# nullstone/rails

Rails Base Image that is optimized for production and configured to operate locally the same way.
This image is very opinionated; however, not restrictive.

This image is configured with:
- Server optimized for puma.
- Static assets and files are automatically added using `ONBUILD` during your docker build process.
- When making code changes, no need to rebuild/restart your container.
- Logs are emitted to stdout/stderr.
- The resulting image is small (~37mb).
- Preconfigured to attach [nginx](https://www.nginx.com/) sidecar container. See below.

## Nginx sidecar

This image is configured to easily connect a sidecar container running nginx.
By doing so, nginx can serve static assets with php requests forwarded to this container.

There are 3 volumes exposed in this image that are shared with the nginx sidecar.
These volumes automatically configure nginx to serve static assets and php properly.

See [examples/basic/docker-compose.yml](examples/basic/docker-compose.yml) for working example for local development.
