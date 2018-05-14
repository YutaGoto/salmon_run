require 'csv'

namespace :salmon_crawler do
  # salmon_crawler:exec
  desc 'サーモン・ランwikiにあるデータをクロールする'
  task exec: :environment do
    base_url = 'https://wikiwiki.jp/splatoon2mix/%E3%82%B5%E3%83%BC%E3%83%A2%E3%83%B3%E3%83%A9%E3%83%B3/%E9%96%8B%E5%82%AC%E5%B1%A5%E6%AD%B4'
    CSV.open('./tmp/file.csv', 'w') do |csv|
      doc = Nokogiri::HTML(
        open(
          "#{base_url}",
        ),
      )
      i = 0
      arr = []
      doc.css('.style_td').each do |elem|
        arr[i] = elem.text
        i += 1
      end
      csv << arr
    end
  end
end
