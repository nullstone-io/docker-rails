# syntax=docker/dockerfile:1

FROM ruby:3.1-alpine

RUN apk add --no-cache --update \
    build-base \
    postgresql-client \
    postgresql-dev \
    tzdata

# Set up entrypoint
WORKDIR /
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Set up bundle path
RUN mkdir -p /usr/local/bundle
ENV BUNDLE_PATH /usr/local/bundle

# Set up pid file
RUN mkdir -p /var/run/
ENV PIDFILE /var/run/puma.pid

# Configure default environment setup
WORKDIR /app
ENV RAILS_LOG_TO_STDOUT true

ENV PORT 80
EXPOSE 80

CMD bundle exec rails server -b 0.0.0.0
