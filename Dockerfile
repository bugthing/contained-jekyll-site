FROM ruby:2.5.1-alpine
RUN apk update && \
    apk upgrade && \
    apk add g++ make nginx && \
    rm -rf /var/cache/apk/*
WORKDIR /usr/src/app
EXPOSE 80
EXPOSE 4000
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ./build-n-serve
