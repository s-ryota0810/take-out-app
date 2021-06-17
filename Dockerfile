FROM ruby:2.6.5

ENV LANG C.UTF-8
ENV APP_ROOT /takeout-app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  build-essential \
  nodejs \
  yarn && \
  apt-get clean && \
  rm --recursive --force /var/lib/apt/lists/*

RUN mkdir $APP_ROOT

WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . $APP_ROOT

RUN yarn install --check-files
RUN bundle exec rails webpacker:compile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]