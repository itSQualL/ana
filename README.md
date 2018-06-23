# README

## RUN WITH DOCKER ON DEVELOPMENT

Prerequisites: you need to install docker and docker-compose

Run: `docker-compose build web`

Run: `docker-compose run web bundle exec rake db:create`

Run: `docker-compose run web bundle exec rake db:migrate`

Run: `docker-compose up web`

## API DOCS:

[Check here all the API documentation](./docs/api_v1_docs.md)
