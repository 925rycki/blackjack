# frozen_string_literal: true

require './PlayerCommon'

# ディーラーを管理するクラス
class Dealer < PlayerCommon
  # ディーラーの2枚目のカードを見せる
  def show_second_card
    puts "ディーラーの引いた2枚目のカードは#{cards[1]}でした。"
  end

  # カードを一枚引く
  def draw(card)
    puts "ディーラーの引いたカードは#{card}です。"
    add_card(card)
  end
end
