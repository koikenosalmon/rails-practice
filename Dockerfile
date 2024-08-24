# # ベースイメージとしてRuby 2.5.8を使用
# FROM ruby:2.5.8

# # Node.jsとYarnをインストール（Railsのアセットパイプラインに必要）
# RUN apt-get update -qq && apt-get install -y nodejs yarn

# # 作業ディレクトリを設定
# WORKDIR /myapp

# # GemfileとGemfile.lockをコピー
# COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock

# # Gemをインストール
# RUN bundle install

# # アプリケーションのコードをコピー
# COPY . /myapp

FROM ruby:2.5.8

# 必要なパッケージを更新・インストール
RUN apt-get update -qq && apt-get install -y nodejs yarn

# 必要なバージョンに rubygems を更新
RUN gem update --system 3.3.22

# 作業ディレクトリを設定
WORKDIR /myapp

# Gemfile と Gemfile.lock を最初にコピー（キャッシュを利用するため）
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# 依存関係をインストール
RUN bundle install

# アプリケーションコードをコピー
COPY . /myapp

# Rails サーバを起動
CMD ["rails", "server", "-b", "0.0.0.0"]