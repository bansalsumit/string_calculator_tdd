FROM ruby:alpine
COPY . /app
WORKDIR /app
CMD ruby test_calculator.rb