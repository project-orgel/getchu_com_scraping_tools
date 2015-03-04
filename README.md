#Getchu.com Scraping Tools

http://www.getchu.com/

## 開発Tips

### デバッグ用にページを保存しておくためのcurlコード
    curl -o ./sample_page/2015_02.html 'http://www.getchu.com/all/month_title.html?genre=pc_soft&gage=&year=2015&month=02'

* -o でファイル名を指定しないと変なファイル名になる(クエリーパラメーターに特殊文字があるので)
* URLを'で囲まないと途中で切れる(シェル特殊文字を含むため)