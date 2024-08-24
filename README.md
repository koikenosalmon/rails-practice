環境構築手順
Docker を使って Rails 5.2.8.1 および Ruby 2.5.8 の新規プロジェクトを構築する手順を以下に示します。Docker では Dockerfile と docker-compose.yml を使用します。

### 手順 1: プロジェクトディレクトリを作成

mkdir my_rails_project
cd my_rails_project

### 手順 2: Dockerfile を作成

### 手順 3: Gemfile と Gemfile.lock を作成

次に、`Gemfile`と`Gemfile.lock`ファイルをプロジェクトのルートディレクトリに作成します。

**Gemfile**

```Ruby
source 'https://rubygems.org'
gem 'rails', '5.2.8.1'
```

**Gemfile.lock**

空のファイルを作成します（内容は空で構いません）。

$ touch Gemfile.lock

### 手順 4: docker-compose.yml を作成

### 手順 5: データベースの設定

`config/database.yml`を作成します。

### 手順 6: Rails プロジェクトの作成

Docker コンテナを使って Rails プロジェクトを新規作成します。

$ docker-compose run web rails new . --force --database=postgresql --skip-bundle

### 手順 7: 再度 Gem をインストール

もう一度、`bundle install`を実行して Gem をインストールします。

$ docker-compose run web bundle install

### 手順 8: データベースの作成

データベースを作成します。

$ docker-compose run web rails db:create

### 手順 9: Docker コンテナの起動

最後に、Docker コンテナを起動します。

```sh
docker-compose up
```

これで、`http://localhost:3000`にアクセスすれば、新規に作成した Rails 5.2.8.1 のプロジェクトが起動しているはずです。ここまででプロジェクトの基本的なセットアップは完了です。コードの変更が保存されるたびにコンテナを再起動して適用してください。

docker-compose run web rake db:create

docker-compose run web rake db:migrate
