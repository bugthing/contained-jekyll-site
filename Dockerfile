FROM ruby:3.3-alpine
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
RUN mv build-n-serve /usr/local/build-n-serve
CMD /usr/local/build-n-serve
