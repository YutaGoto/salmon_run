# salmon_run

Splatoon2のサーモン・ランブキ変遷

このリポジトリは非公式のもので、完全に個人的な趣味で作っているものです。

[![CircleCI](https://circleci.com/gh/YutaGoto/salmon_run.svg?style=svg)](https://circleci.com/gh/YutaGoto/salmon_run)
[![Build Status](https://travis-ci.com/YutaGoto/salmon_run.svg?branch=develop)](https://travis-ci.com/YutaGoto/salmon_run)
[![codebeat badge](https://codebeat.co/badges/1ea02ea6-2394-4f03-aa37-0e789b79525a)](https://codebeat.co/projects/github-com-yutagoto-salmon_run-develop)

![salmon](salmon.gif)

## Spec

* Ruby version: 2.5.1
* Rails version: 5.2.1
* PostgreSQL version: 10.4
* yarn version: 1.5.1
* jQuery: v3.3.1
* vue: 2.5.17
* Bootstrap: v4.1.3

### tools

* [CircleCI 2.0](https://circleci.com/)
* [travisCI](https://travis-ci.org/)
* [Sider](https://sider.review/)
* [codebeat](https://codebeat.co/)

## 初期設定

```sh
$ docker-compose build
$ docker-compose run web bin/setup
```

### 起動コマンド

```sh
$ docker-compose up
```

### docker imageの削除

```sh
$ docker-compose down --rmi all
$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
ruby                   2.5.1               hogehoge1234        6 days ago          869MB
$ docker rmi [IMAGE ID]
```

# サーモンラン とは

- [サーモンラン | スプラトゥーン2](https://www.nintendo.co.jp/switch/aab6a/coop/index.html)

# 活動報告

- [Rails5の練習をしている件](https://medium.com/@gggooottto/rails5%E3%81%AE%E7%B7%B4%E7%BF%92%E3%82%92%E3%81%97%E3%81%A6%E3%81%84%E3%82%8B%E4%BB%B6-a9b46a0fb6e5)
- [Rails5の練習をしている件2](https://medium.com/@gggooottto/rails5%E3%81%AE%E7%B7%B4%E7%BF%92%E3%82%92%E3%81%97%E3%81%A6%E3%81%84%E3%82%8B%E4%BB%B62-d4fdce635bcc)
- [Rails5の練習をしている件3]https://medium.com/@gggooottto/rails5%E3%81%AE%E7%B7%B4%E7%BF%92%E3%82%92%E3%81%97%E3%81%A6%E3%81%84%E3%82%8B%E4%BB%B63-40398a24e7b1
