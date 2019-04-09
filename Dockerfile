FROM ruby:2.5-alpine

ADD Gemfile Gemfile.lock /app/
RUN apk --update add --virtual build-dependencies ruby-dev build-base && \
    gem install bundler --no-document && \
    cd /app ; bundle install --without development test && \
    apk del build-dependencies
ADD . /app
RUN chown -R nobody:nogroup /app
USER nobody
WORKDIR /app
CMD ruby /app/bin/bot
