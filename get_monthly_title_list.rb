require 'nokogiri'
require 'open-uri'

#エロゲ
#'http://www.getchu.com/all/month_title.html?genre=pc_soft&gage=&year=2015&month=02'
#アニメ
#http://www.getchu.com/all/month_title.html?genre=anime_dvd&gage=normal

#TODO 引数はファイルかURLをとれるように -f で引数のファイルが存在してたらファイルとして処理
# file.html
target = ARGV[0]

doc = nil
f = File.open(target)
  doc = Nokogiri::HTML(f, nil, 'EUC-JP')
f.close
charset = nil

index_counter = 0
title_list = []
doc.xpath('//div[@class="category_pc_b"]').each do |node|
  index_counter+=1
  if index_counter > 2
    link_list = node.search('a')
    link_list.each do | nc |
      #タイトル作品のリンクはフルパスではなくsoft...から始まる
      if /^\/soft/ =~ nc.values[0]
        #タイトルのhrefテキストにはレイアウト調整のためのタブがたくさん入ってるので除外
        s = nc.text.gsub(/\t|\r|\n/, '')
        #末尾の全角スペースは除外
        s.gsub!(/　$/, '')
        if (!s.nil? && '' != s)
          #特典のリンクは★から始まるので除外
          unless /^★/ =~ s
            title_list.push(s)
          end
        end
      end
    end
  end
end

# １つのタイトルで複数バージョンあるので、厳密に１つに絞るための関数
# def strict_fillter 初回限定盤　初回版　豪華版 から始まる文字列は削除する、リストから重複が見つかったら削除する

# TwitterのStreamingAPIの検索キー用にタイトルをカンマで結合し出力します
def out_twitter_streaming_keys(title_list)
  puts title_list.join(',')
end




#タイトル一覧を出力(加工なし)
title_list.map {|title| puts title}

#Twitter検索用に出力
out_twitter_streaming_keys(title_list)

puts title_list.size