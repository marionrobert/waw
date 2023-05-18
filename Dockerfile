FROM ruby:3.1.2-bullseye

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -\
  && apt-get update -qq \
  && apt-get install -qq --no-install-recommends nodejs \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

RUN bundle install

COPY . .

EXPOSE 3000