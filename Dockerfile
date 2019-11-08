FROM ruby:2.6.5

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN gem install bundler

COPY . /livestorm

WORKDIR /livestorm/livestorm
RUN bundle install
RUN rake install

WORKDIR /livestorm