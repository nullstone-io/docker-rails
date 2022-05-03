# syntax=docker/dockerfile:1

ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-alpine

RUN apk add --no-cache --update \
    build-base \
    postgresql-client \
    postgresql-dev \
    nodejs yarn \
    tzdata

VOLUME /etc/nginx/conf.d
VOLUME /etc/nginx/templates
VOLUME /app/public

COPY etc/ /etc/

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

ENV PORT 9000
EXPOSE 9000

CMD bundle exec rails server -b 0.0.0.0
