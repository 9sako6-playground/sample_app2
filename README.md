# Ruby on Rails チュートリアルのサンプルアプリケーション

これは、次の教材で作られたサンプルアプリケーションです。  
[_Ruby on Rails チュートリアル_](https://railstutorial.jp/)
[Michael Hartl](http://www.michaelhartl.com/) 著

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードは MIT ライセンスと Beerware ライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```bash
bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```bash
bin/rails db:migrate
```

起動するには[ImageMagick](https://imagemagick.org/index.php)が必要です。

```bash
sudo yum install -y ImageMagick
# or
brew install imagemagick
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```bash
bundle exec rspec
```

テストが無事に通ったら、Rails サーバーを立ち上げる準備が整っているはずです。

```bash
bin/rails server
```

詳しくは、[_Ruby on Rails チュートリアル_](https://railstutorial.jp/)
を参考にしてください。

<hr>

# To do

**[Rails Tutorial](https://railstutorial.jp/) 2 周目**

**Must**

- [x] Rails 6.0.3 + Ruby 2.7.1
- [x] rspec

**Optional**

- [x] pagination with kaminari/kaminari
- [x] fixtures with thoughtbot/factory_bot
- [ ] presidentbeef/brakeman
- [x] auto testing with GitHub Actions
- [x] UI framework
  - tailwindcss
    ref: [Rails 6 and Tailwind CSS via Webpacker— Getting Started](https://medium.com/@davidteren/rails-6-and-tailwindcss-getting-started-42ba59e45393)
- [x] haml/haml
