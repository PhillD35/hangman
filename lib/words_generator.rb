require 'nokogiri'
require 'open-uri'

class WordsGenerator
  # Толковый словарь Двля
  URL = 'http://litmaster.net/index.php?book=3/'

  def self.create_list
    list_of_words = find_words(URL)

    save_words(list_of_words)
  end

  private
  def self.find_words(path)
    doc = Nokogiri::HTML(open(URL))

    words = doc.xpath('//td/a[@class="green"]').map { |word| word.text.gsub(/\s/, '') }
  end

  def self.save_words(list)
    File.open('data/words.txt', 'w:UTF-8') do |file|
        file.puts(list)
    end
  end
end
