FROM ruby:2.6

RUN apt-get update -y && apt-get install -y nodejs

WORKDIR /opt/Launchpad

COPY . .
RUN bundle install \
  && ruby bin/rake db:migrate RAILS_ENV=development
  
ENTRYPOINT ["ruby"]
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000/tcp
