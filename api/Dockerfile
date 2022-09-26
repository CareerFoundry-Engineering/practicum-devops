FROM ruby:3.0.0

RUN apt-get update

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && apt-get update \
  && apt -y install gnupg2 \
  && apt-get install -y curl zlib1g-dev ruby-dev \
  && apt-get -y autoclean

RUN apt-get install -y imagemagick

ENV APP_HOME /workspace
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN source ~/.bashrc

COPY Gemfile $APP_HOME/
COPY Gemfile.lock $APP_HOME/
RUN gem install bundler:2.2.3 && bundle install
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bundle exec rails s -b 0.0.0.0 -p 3000"]
