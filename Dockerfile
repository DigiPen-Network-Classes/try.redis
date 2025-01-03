FROM ruby:2.4

# build tools and redis (local install expected)
RUN apt-get update && apt-get install -y build-essential redis-server

WORKDIR /home/tryredis/try.redis/current

COPY Gemfile Gemfile.lock ./

# install old bundler version for gemfile:
RUN gem install bundler -v 1.11.2

# now install gems using old bundler:
RUN bundle _1.11.2_ install

COPY . .

# create shared folder
RUN mkdir -p /home/tryredis/try.redis/shared/sockets
RUN mkdir -p /home/tryredis/try.redis/shared/pids
# redis folder
RUN mkdir -p /home/tryredis/try.redis/current/log

# changed config.rb to bind to tcp instead of unix:
EXPOSE 4567

ENV RACK_ENV=development
CMD ["./entrypoint.sh"]
