FROM ruby:3.1.2
RUN apt-get update -qq --fix-missing && \
    apt-get install -yq --no-install-recommends \
                       build-essential \
                       libpq-dev \
                       pkg-config \
                       glib2.0-dev \
                       libexpat1-dev \
                       software-properties-common \
                       postgresql-client \
                       tmux \
                      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Overmind
RUN set -ex \
        && wget -q https://github.com/DarthSim/overmind/releases/download/v2.3.0/overmind-v2.3.0-linux-amd64.gz \
        && gunzip overmind-v2.3.0-linux-amd64.gz \
        && chmod +x overmind-v2.3.0-linux-amd64 \
        && mv overmind-v2.3.0-linux-amd64 /usr/local/bin/overmind

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ARG RAILS_ENV="production"
ENV RAILS_ENV="${RAILS_ENV}"

RUN echo "gem: --no-document" >> ~/.gemrc
RUN gem update --system
RUN gem install bundler

COPY Gemfile Gemfile.lock .ruby-version ./
RUN bundle install --jobs 8 --retry 3 --without development test

# Copy the main application.
COPY . ./

# Remove development files
RUN rm -rf .github
RUN rm -rf .env localhost.crt localhost.key
RUN rm -rf test spec

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
