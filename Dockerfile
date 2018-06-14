FROM ruby:2.5

MAINTAINER Sergio Ruiz <sergioacaraballo@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set ruby console history
# Enable console history
RUN echo "require 'irb/ext/save-history'" | tee -a ~/.irbrc
RUN echo "IRB.conf[:SAVE_HISTORY] = 2000" | tee -a ~/.irbrc
RUN echo "IRB.conf[:HISTORY_FILE] = '~/irb_history/.irb-history'" | tee -a ~/.irbrc
ENV HISTFILE=/root/bash_history/.bash_history

RUN mkdir -p /app
WORKDIR /app
