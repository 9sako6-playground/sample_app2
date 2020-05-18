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

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事に通ったら、Rails サーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

詳しくは、[_Ruby on Rails チュートリアル_](https://railstutorial.jp/)
を参考にしてください。

<hr>

# To do

**[Rails Tutorial](https://railstutorial.jp/) 2 周目**

**Must**

- [x] Rails 6.0.3 + Ruby 2.7.1
- [ ] rspec を使う

**Optional**

- [ ] Pagination に kaminari/kaminari を使う
- [ ] fixtures に thoughtbot/factory_bot を使う
- [ ] presidentbeef/brakeman を使う
- ~~Docker を使う~~
- [ ] CI を使う
- [ ] Bootstrap 以外の UI フレームワークを開拓して使う
- [ ] haml/haml を使う
