# 農業委員会活動整理カード収集機
[農業委員会活動整理カード](https://www.nca.or.jp/card/)情報を収集し、CSVで吐き出します。全国各地1681市町村の農業委員会のデータを瞬時に収集できます。

データを表形式で公開せずに、研究者にクローラを書かせる全国農業会議所は本当に＊＊。反省して欲しいです。
というか、毎年データを上書きしているの、どういう了見なんでしょうか。

農業委員会が農地の賃貸借に対してどのような効果を及ぼしているかなどの分析にご利用ください。

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
