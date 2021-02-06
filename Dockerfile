FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y yarn

RUN mkdir /ki-ichi
WORKDIR /ki-ichi

COPY Gemfile /ki-ichi/Gemfile
COPY Gemfile.lock /ki-ichi/Gemfile.lock

RUN gem install bundler
RUN bundle install
COPY . /ki-ichi
