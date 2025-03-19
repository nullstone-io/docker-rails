# nullstone/rails

Rails Base Image that is optimized for production and configured to operate locally the same way.
This image is very opinionated; however, not restrictive.

## Quick Reference

- Maintained by
  [Nullstone](https://nullstone.io)
- Where to get help
  [Nullstone Slack](https://join.slack.com/t/nullstone-community/signup)

## Supported Tags and respective `Dockerfile` links

### Ruby 3.3
- [ruby3.3, ruby3, latest](Dockerfile)
- [ruby3.3-webapp, ruby3-webapp, webapp](webapp/Dockerfile)

### Ruby 3.2
- [ruby3.2](Dockerfile)
- [ruby3.2-webapp](webapp/Dockerfile)
- 
### Ruby 3.1
- [ruby3.1](Dockerfile)
- [ruby3.1-webapp](webapp/Dockerfile)

### Ruby 3.0
- [ruby3.0](Dockerfile)
- [ruby3.0-webapp](webapp/Dockerfile)

### Ruby 2.7
- [ruby2.7](Dockerfile)
- [ruby2.7-webapp](webapp/Dockerfile)

## Production vs Local

This repository builds an image for local use and production use.

The local image configures:
- Sets the environment variable `RAILS_ENV=development`
- On boot, the image runs `bundle install` (means you only need to restart the docker container when updating `Gemfile`)

## Base image vs webapp image 

This repository builds 2 variants of images: a base image and a webapp image.

The base image configures:
- Server optimized for puma.
- When making code changes locally, there is no need to rebuild/restart your container.
- Logs are emitted to stdout.
- Sets `PORT` env var to `80`
- On boot, `POSTGRES_URL` sets `DB_ADAPTER=postgresql`, `DATABASE_URL=$POSTGRES_URL`
- On boot, `MYSQL_URL` sets `DB_ADAPTER=mysql`, `DATABASE_URL=$MYSQL_URL`

The webapp image additionally configures:
- Preconfigures the image to attach [nginx](https://www.nginx.com/) sidecar container. See below.
- Changes `PORT` env var to `9000` to allow nginx to use port `80`

## Nginx sidecar

The webapp image is configured to optionally connect sidecar container running nginx.
This pattern allows you to use nginx to serve static assets while the rails server serves dynamic requests.

#### docker-compose
See [examples/webapp/prod.docker-compose.yml](examples/webapp/prod.docker-compose.yml) for a docker compose that mimics a production environment.

#### Nullstone
The following Nullstones modules provide one-click addition of an nginx sidecar:
- Fargate Service (via Nullstone): [nullstone/aws-fargate-nginx-sidecar](https://app.nullstone.io/orgs/BSick7/registry/modules/nullstone/aws-fargate-nginx-sidecar)

### Static Assets

Make sure to place all static content into `/app/public` inside the container.
With a typical rails setup, this is done with the following in `Dockerfile`.
```
...
COPY . . # copies all rails code including `./public` into `/app`
RUN bundle exec rake assets:precompile
RUN bundle exec rake assets:clean
```
