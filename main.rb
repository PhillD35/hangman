if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"
require_relative "lib/words_generator"

WORDS_FILE_PATH = "#{__dir__}/data/words.txt".freeze
VERSION = "Игра \"Виселица.\" версия 4.0.\n\n".freeze

system 'mkdir data' unless Dir.exist?("#{__dir__}/data")
WordsGenerator.create_list(WORDS_FILE_PATH) unless File.exist?(WORDS_FILE_PATH)

WordsGenerator.create_list(WORDS_FILE_PATH) if ARGV[0] == '-n'

word = WordReader.read_from_file(WORDS_FILE_PATH)
game = Game.new(word: word, version: VERSION)

printer = ResultPrinter.new(game)

while game.in_progress? do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
