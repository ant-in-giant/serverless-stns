FROM ruby:2.7.4

RUN mkdir /app
WORKDIR /app
COPY src/Gemfile* /app/
RUN bundle install --without test
