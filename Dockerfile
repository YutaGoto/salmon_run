FROM ruby:2.6.5
ENV LANG C.UTF-8
ENV APP_ROOT /my_app
RUN apt-get update -qq && apt-get install -y build-essential postgresql-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install
RUN yarn install
ADD . $APP_ROOT
