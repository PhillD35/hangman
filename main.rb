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

WordsGenerator.create_list if ARGV[0] == '-new'

VERSION = "Игра \"Виселица.\" версия 4.0.\n\n"

word = WordReader.read_from_file("#{__dir__}/data/words.txt")
game = Game.new(word: word, version: VERSION)

printer = ResultPrinter.new(game)

while game.in_progress? do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
