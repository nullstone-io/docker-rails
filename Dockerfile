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
RUN mkdir -p /var/run/
RUN touch /var/run/puma.pid
ONBUILD ENV PIDFILE /var/run/puma.pid
ONBUILD ENV PORT 9000
ONBUILD ENV RAILS_LOG_TO_STDOUT true
ONBUILD WORKDIR /app
ONBUILD COPY . .
ONBUILD RUN gem install bundler && bundle install

EXPOSE 9000
CMD bundle exec rails server
