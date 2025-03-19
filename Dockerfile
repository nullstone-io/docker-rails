ARG RUBY_VERSION=3.3
FROM ruby:${RUBY_VERSION}-alpine

RUN apk add --no-cache --update \
    build-base \
    postgresql-client \
    postgresql-dev \
    tzdata

# Set up entrypoint
WORKDIR /
COPY docker-entrypoint.sh .
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /docker-entrypoint.d
COPY docker-entrypoint.d/*.sh .
RUN chmod +x /docker-entrypoint.d/*.sh

# Set up bundler
RUN mkdir -p /usr/local/bundle
ENV BUNDLE_PATH=/usr/local/bundle
RUN gem install bundler

# Set up pid file
RUN mkdir -p /var/run/
ENV PIDFILE=/var/run/puma.pid

# Configure default environment setup
WORKDIR /app
ENV RAILS_LOG_TO_STDOUT=true

ENV BINDING=0.0.0.0
ENV PORT=80
EXPOSE 80

CMD ["bundle", "exec", "rails", "server"]
