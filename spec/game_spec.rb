require 'rspec'
require 'game'

describe Game do

  before :each do
    @game = Game.new(word: 'Gratitude')
  end

  it '#letters' do
    expect(@game.letters).to eq %w[g r a t i t u d e]
  end

  it '#won?' do
    @game.letters.each do |letter|
      @game.next_step(letter)
    end
    expect(@game.won?).to be_truthy
  end

  it '#errors_left' do
    %w[у к т].each do |letter|
      @game.next_step(letter)
    end
    expect(@game.errors).to eq 3
    expect(@game.errors_left).to eq 4
  end

  it '#lost?' do
    %w[п о з о р т о к а к о й].each do |letter|
      @game.next_step(letter)
    end
    expect(@game.lost?).to be_truthy
  end
end
