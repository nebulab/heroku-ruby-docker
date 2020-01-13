ARG STACK_VERSION=18

FROM heroku/heroku:$STACK_VERSION-build

ARG STACK_VERSION=18
ARG DOCKERIZE_VERSION=0.6.1
ARG RUBY_VERSION=2.6.5
ARG BUNDLER_VERSION=2.0.2
ARG NODE_VERSION=12.14.0
ARG YARN_VERSION=1.21.1
ARG DEFAULT_WORKDIR=/usr/src/app

ENV LANG=en_US.UTF-8 \
  STACK=heroku-$STACK_VERSION \
  DOCKERIZE_VERSION=$DOCKERIZE_VERSION \
  BUNDLE_JOBS=3 BUNDLE_RETRY=3 \
  RUBY_VERSION=$RUBY_VERSION \
  BUNDLER_VERSION=$BUNDLER_VERSION \
  NODE_VERSION=$NODE_VERSION \
  YARN_VERSION=$YARN_VERSION \
  RUBY_HOME=/usr/local/lib/ruby \
  NODE_HOME=/usr/local/lib/node \
  YARN_HOME=/usr/local/lib/yarn

RUN curl -s --retry 3 -L \
    https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz \
    | tar xz -C /usr/local/bin

RUN mkdir -p $RUBY_HOME && \
  curl -s --retry 3 -L \
    https://heroku-buildpack-ruby.s3.amazonaws.com/$STACK/ruby-$RUBY_VERSION.tgz \
    | tar xz -C $RUBY_HOME

RUN mkdir -p $NODE_HOME && \
  curl -s --retry 3 -L \
    https://heroku-nodebin.s3.amazonaws.com/node/release/linux-x64/node-v$NODE_VERSION-linux-x64.tar.gz \
    | tar xz -C $NODE_HOME --strip 1

RUN mkdir -p $YARN_HOME && \
  curl -s --retry 3 -L \
    http://heroku-nodebin.s3.amazonaws.com/yarn/release/yarn-v$YARN_VERSION.tar.gz \
    | tar xz -C $YARN_HOME --strip 1

ENV PATH $RUBY_HOME/bin:$YARN_HOME/bin:$NODE_HOME/bin:$PATH

RUN gem install -f bundler:$BUNDLER_VERSION && \
  curl https://cli-assets.heroku.com/install.sh | sh
