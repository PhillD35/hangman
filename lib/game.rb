class Game
  attr_reader :errors, :bad_letters, :good_letters, :letters, :status, :version, :word

  MAX_ERRORS = 7

  def initialize(word:, version: nil)
    @version = version
    @word = word

    @letters = get_letters(word)
    @good_letters = []
    @bad_letters = []

    @errors = 0
    @status = :in_progress # :won :lost
  end

  def get_letters(word)
    word.downcase.split("")
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def ask_next_letter
    puts "\nВведите следующую букву"
    input = ""

    while input == "" do
      input = STDIN.gets.chomp.downcase
    end

    input.each_char { |char| next_step(char) }
  end

  def repeted?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end

  def is_good?(letter)
    @letters.include?(letter) ||
    (letter == 'и' && @letters.include?('й')) ||
    (letter == 'й' && @letters.include?('и')) ||
    (letter == 'е' && @letters.include?('ё')) ||
    (letter == 'й' && @letters.include?('е'))
  end

  def add_letter_to(letters, letter)
    letters << letter

    case letter
    when 'и' then letters << 'й'
    when 'й' then letters << 'и'
    when 'е' then letters << 'ё'
    when 'ё' then letters << 'е'
    end
  end

  def solved?
    (@letters - @good_letters).empty?
  end

  def next_step(letter)
    return if @status == :lost || @status == :won
    return if repeted?(letter)

    if is_good?(letter)
      add_letter_to(@good_letters, letter)

      @status = :won if solved?
    else
      add_letter_to(@bad_letters, letter)
      @errors += 1
    end

    @status = :lost if lost?
  end
end
