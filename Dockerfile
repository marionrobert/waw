# //VERSION DE VINCENT, FONCTIONNE MAIS PAS DE JS
# FROM ruby:3.1.2-bullseye

# # throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

# WORKDIR /app

# COPY Gemfile Gemfile.lock ./

# RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -\
#   && apt-get update -qq \
#   && apt-get install -qq --no-install-recommends nodejs \
#   && apt-get upgrade -qq \
#   && apt-get clean \
#   && rm -rf /var/lib/apt/lists/*\
#   && npm install -g yarn@1

# RUN bundle install

# COPY . .

# EXPOSE 3000



# //VERSION DE TEST POUR VERIFIER SI LE JS PEUX FONCTIONNER DE LA SORTE

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

RUN mkdir -p /app/tmp/pids
RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
