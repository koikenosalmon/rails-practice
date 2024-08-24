docker-compose up

docker-compose run web rake db:create

docker-compose run web rake db:migrate

これで、`http://localhost:3000`にアクセスすれば、新規に作成した Rails 5.2.8.1 のプロジェクトが起動しているはずです。ここまででプロジェクトの基本的なセットアップは完了です。コードの変更が保存されるたびにコンテナを再起動して適用してください。
