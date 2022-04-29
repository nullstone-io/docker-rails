ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-alpine

RUN apk add --no-cache --update \
    build-base \
    postgresql-client \
    postgresql-dev \
    tzdata

VOLUME /etc/nginx/conf.d
VOLUME /etc/nginx/templates
VOLUME /app/public

COPY etc/ /etc/

# Set up root entrypoint
WORKDIR /
COPY docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Configure Rails app
RUN mkdir -p /usr/local/bundle
RUN mkdir -p /var/run/
WORKDIR /app

# Configure default environment setup
ENV PIDFILE /var/run/puma.pid
ENV PORT 9000
ENV RAILS_LOG_TO_STDOUT true
ENV BUNDLE_PATH /usr/local/bundle

EXPOSE 9000
CMD bundle exec rails server -b 0.0.0.0
