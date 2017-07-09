FROM ruby:2.3.1

RUN apt-get update && apt-get install -y rsync

COPY Gemfile /tmp
COPY Gemfile.lock /tmp
RUN cd /tmp && bundle install --jobs 3 --retry 3

WORKDIR /srv/jekyll
CMD bundle exec rake serve
