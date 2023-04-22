# frozen_string_literal: true

# カード単体のマークと値を管理するクラス
class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  # 文字列に変換するメソッド
  def to_s
    "#{suit}の#{rank}"
  end
end
