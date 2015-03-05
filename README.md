#Getchu.com Scraping Tools

http://www.getchu.com/

## Command Util

### get_monthly_title_list.rb

エロゲの月別発売ページからタイトルを抽出します

|項目|説明|
|引数1|HTMLファイル名、もしくはURL|

    bundle exec ruby get_monthly_title_list.rb 'http://www.getchu.com/all/month_title.html?genre=pc_soft&gage=all&year=2014&month=7'
    bundle exec ruby get_monthly_title_list.rb sample_page/2015_01.html
    
## 開発Tips

### デバッグ用にページを保存しておくためのcurlコード
    curl -o ./sample_page/2015_02.html 'http://www.getchu.com/all/month_title.html?genre=pc_soft&gage=&year=2015&month=02'

* -o でファイル名を指定しないと変なファイル名になる(クエリーパラメーターに特殊文字があるので)
* URLを'で囲まないと途中で切れる(シェル特殊文字を含むため)