FROM ruby:alpine
COPY . /app
WORKDIR /app
CMD ruby calculator.rb