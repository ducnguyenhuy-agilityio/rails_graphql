FROM ruby:2.4-alpine

ENV DOCUMENT_ROOT /home/app

# - Update apk repo
# - Install needed packages
# - Install postgresql-dev if you intend to use postgresql database
RUN apk update && apk upgrade && apk add g++ make sqlite-dev nodejs tzdata postgresql-dev git

ENV BUNDLE_PATH=/bundle

WORKDIR $DOCUMENT_ROOT

COPY Gemfile* ./

RUN bundle install

ADD . .

RUN chmod a+x ./docker-entrypoint.sh
CMD sh "./docker-entrypoint.sh"
