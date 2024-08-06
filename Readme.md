# Rubyata bot

[![CircleCI](https://circleci.com/gh/rubyata/bot.svg?style=svg)](https://circleci.com/gh/rubyata/bot)

[Rubyata telegram chat](https://t.me/rubyata) bot.

## Installation

#### Native

    bundle install
    BOT_TOKEN=blabla ./bin/bot

#### Docker and docker-compose

    docker build -t rubyata/bot:latest --platform=linux/amd64 .
    docker-compose up -d

## Configuration
Pass the following environment variables:
- ```BOT_ENV```. Default is ```development```.
- ```BOT_TOKEN```. Token acquired from Telegram BotFather.
- ```ROLLBAR_TOKEN```. If you need to track exceptions.


## Tasks
- [x] Kicks spammers by nicknames.
- [ ] [Idea] Asks new users to solve ruby snippets to detect non-rubyist ;).
- [ ] ....
