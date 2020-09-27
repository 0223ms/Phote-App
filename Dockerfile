FROM ruby:2.5.1

RUN apt-get update -qq && \
  apt-get install -y build-essential \ 
  libpq-dev \        
  nodejs           

RUN mkdir /freemarket_sample_66a
ENV APP_ROOT /freemarket_sample_66a
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler -v 1.3.0
RUN bundle install
ADD . $APP_ROOT