FROM jekyll/jekyll:3.2.1

COPY Gemfile /tmp
COPY Gemfile.lock /tmp
RUN cd /tmp && bundle install
