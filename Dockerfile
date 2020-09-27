FROM ruby:2.5

RUN apt-get update -qq && \
  apt-get install -y build-essential \ 
  libpq-dev \        
  nodejs           

WORKDIR /Phote-App
COPY Gemfile Gemfile.lock /Phote-App/
RUN bundle install