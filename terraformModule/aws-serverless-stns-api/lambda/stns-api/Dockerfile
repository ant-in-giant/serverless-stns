FROM ruby:2.7.4

RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
#RUN bundle install --without test
RUN gem install bundler \
    && bundle config set --local without 'test' \
    && bundle install
