# frozen_string_literal: true

require './PlayerCommon'

# プレイヤーを管理するクラス
class Player < PlayerCommon
  # カードを引くかを確認する
  def confirm_draw
    puts "あなたの現在の得点は#{calc_points}です。カードを引きますか？ (Y/N)"
  end

  # カードを一枚引く
  def draw(card)
    puts "あなたの引いたカードは#{card}です。"
    add_card(card)
  end
end
