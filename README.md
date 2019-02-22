# 農業委員会活動整理カード収集機
[農業委員会活動整理カード](https://www.nca.or.jp/card/)情報を収集し、CSVで吐き出します。全国各地1681市町村の農業委員会のデータを瞬時に収集できます。

データを表形式で公開せず、かつ毎年データを上書きしているのはどういう了見なんでしょうか。

耕地面積、経営耕地面積などを取得し、CSVとして出力します。

農業委員会が農地の賃貸借に及ぼしている影響の分析などにご利用ください。

## Requirement
* Bundler
* Nokogiri

## Usage
1. `bundle install`
2. `mkdir prefs`
3. `mkdir kartes`
4. `ruby karte_downloader.rb`
5. `ruby karte_inspector.rb`

## Author
[hidesys](https://github.com/hidesys) [(Twitter)](https://twitter.com/hidesys)
