# Vagrant-for-Splunk
SplunkがインストールされたVMを構築するためのVagrantfile

## 使い方
```bash
# VMの起動
vagrant up

# VMへの接続
vagrant ssh

# VMからホストマシンへポートフォワードしているポートを確認する（ホストマシンでポート番号8000が既に使われていた時は、異なるポートが割り当てられる）
vagrant port

# Splunkダッシュボードへの接続
http://127.0.0.1:8000
```

## 参考にさせていただいたページ
https://zenn.dev/y_mrok/books/ansible-no-tsukaikata/viewer/chapter4