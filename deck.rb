# frozen_string_literal: true

# デッキを管理するクラス
class Deck
  attr_reader :cards

  # 52枚のカードを生成し、シャッフルする
  def initialize
    @cards = []
    suits = ['☘', '♥', '♦', '♠']
    ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  # カードを一枚配る
  def deal
    @cards.pop
  end
end
