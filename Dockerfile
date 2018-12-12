FROM ruby:2.5.3
ENV LANG C.UTF-8
ENV APP_ROOT /my_app
RUN apt-get update -qq && apt-get install -y build-essential postgresql-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
                                                         apt-get install nodejs
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
ADD package.json ${APP_ROOT}/package.json
ADD yarn.lock ${APP_ROOT}/yarn.lock
RUN bundle install
RUN NODE_ENV=development yarn install
ADD . $APP_ROOT
