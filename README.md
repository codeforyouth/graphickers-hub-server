# Graphickers-hub
Graphickers-hubのバックエンド側ソースコードです。

Graphickers-hubは全国のGraphickerに自身の活動記録を掲載して頂くサイトです。
Graphickerにお仕事を依頼されたい方が本サイトを通じてGraphickerへ連絡を取って頂けるようにもなっております。

Graphickerとは、グラフィックレコーダーやグラフィックファシリテータ等、様々なイベントや会議で行われる人々の議論や発表を、
図や文字を用いてリアルタイムで可視化する人の事を指します。
Graphickerによりイベント中の議論・発表内容が可視化されることにより、イベント中・終了後に議論や発表の内容を多くの人に直感的に共有することが可能となります。


クライアント側はこちら  
https://github.com/codeforyouth/graphickers-hub-client

## 公開ページ
https://www.graphickers-hub.net/

github上のmasterブランチにコードがpushされると以下のURLに対して自動デプロイされる。
https://api.graphickers-hub.net/

## 必須ソフトウェア
* ruby 2.6.5
* rails 6.0.0
* Bundler 1.17.3
 
## 開発環境起動方法
本ソースコードをローカルにcloneした上で以下を実行。
```bash
bundle install
rails db:create
rails db:migrate
rails s
```

## ライセンス
LICENSEファイル参照
