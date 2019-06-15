require 'nokogiri'
require 'open-uri'

class WordsGenerator
  # Толковый словарь Даля
  URL = 'http://litmaster.net/index.php?book=3/'.freeze

  def self.create_list(file_path)
    list_of_words = find_words(URL)

    save_words(words: list_of_words, file_path: file_path)
  end

  private

  def self.find_words(path)
    doc = Nokogiri::HTML(open(URL))

    words = doc.xpath('//td/a[@class="green"]').map { |word| word.text.gsub(/\s/, '') }
  end

  def self.save_words(words:, file_path:)
    File.open(file_path, 'w:UTF-8') do |file|
      file.puts(words)
    end
  end
end
