FROM ruby:2.5

MAINTAINER Sergio Ruiz <sergioacaraballo@gmail.com>

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
