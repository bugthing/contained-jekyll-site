FROM ruby:3.1-alpine
RUN apk update && \
    apk upgrade && \
    apk add g++ make nginx && \
    rm -rf /var/cache/apk/*
WORKDIR /app
EXPOSE 80
EXPOSE 4000
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ./build-n-serve
