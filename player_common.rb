# frozen_string_literal: true

# 参加者の共通機能を管理するクラス
class PlayerCommon
  attr_accessor :cards

  def initialize
    @cards = []
  end

  # 手札にカードを加える
  def add_card(card)
    @cards << card
  end

  # ポイントを計算する
  def calc_points
    aces_count = cards.count { |card| card.instance_variable_get(:@rank) == 'A' }
    sum = cards.sum do |card|
      case card.instance_variable_get(:@rank)
      when 'A'
        1
      when 'J', 'Q', 'K'
        10
      else
        card.instance_variable_get(:@rank).to_i
      end
    end
    aces_count.times do
      sum += sum + 10 <= 21 ? 10 : 0
    end
    sum
  end

  # バーストしたかを判定する
  def burst?(points)
    points > 21
  end
end
