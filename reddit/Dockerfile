FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y mongodb-server ruby-full ruby-dev ruby-bundler build-essential && \
    mkdir -p /data/db

WORKDIR /app
EXPOSE 9292

COPY . .

RUN rm Gemfile.lock && bundle install
RUN chmod 0777 start.sh

CMD ["/app/start.sh"]
