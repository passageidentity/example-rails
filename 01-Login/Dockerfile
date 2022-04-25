FROM ruby:3.1.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
ENV BUNDLER_VERSION 2.3.7
COPY . /myapp
RUN gem install bundler -v ${BUNDLER_VERSION} && bundle install --jobs 20 --retry 5
CMD /myapp/bin/rails s -b 0.0.0.0
EXPOSE 3000