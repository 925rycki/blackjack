# frozen_string_literal: true

require './Player'
require './Dealer'
require './Deck'
require './Card'

# ゲームの進行を管理するクラス
class GameDirector
  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  # プレイヤーとディーラーに最初の2枚のカードを配る
  def initial_cards
    2.times do
      player.add_card(deck.deal)
      dealer.add_card(deck.deal)
    end
  end

  # ブラックジャックゲームを開始する
  def start
    puts 'ブラックジャックを開始します。'
    puts "あなたの引いたカードは#{player.cards[0]}です。"
    puts "あなたの引いたカードは#{player.cards[1]}です。"
    puts "ディーラーの引いたカードは#{dealer.cards[0]}です。"
    puts 'ディーラーの引いた2枚目のカードはわかりません。'
  end

  # プレイヤーがバーストした場合
  def player_burst
    puts "あなたの得点は#{player.calc_points}です。"
    puts 'あなたの得点が21点を超えました。'
    puts 'あなたの負けです！'
  end

  # ディーラーのターン
  def dealer_turn
    dealer.show_second_card
    dealer.draw(deck.deal) while dealer.calc_points < 17
  end

  # ディーラーがバーストした場合
  def dealer_burst
    puts "ディーラーの得点は#{dealer.calc_points}です。"
    puts 'ディーラーの得点が21点を超えました。'
    puts 'あなたの勝ちです！'
  end

  # プレイヤーが勝利した場合
  def player_win
    puts "あなたの得点は#{player.calc_points}です。"
    puts "ディーラーの得点は#{dealer.calc_points}です。"
    puts 'あなたの勝ちです！'
  end

  # プレイヤーが敗北した場合
  def player_lose
    puts "あなたの得点は#{player.calc_points}です。"
    puts "ディーラーの得点は#{dealer.calc_points}です。"
    puts 'あなたの負けです！'
  end

  # 引き分けの場合
  def tie_game
    puts "あなたの得点は#{player.calc_points}です。"
    puts "ディーラーの得点は#{dealer.calc_points}です。"
    puts '引き分けです！'
  end

  # 勝敗を判定する
  def judge
    if player.burst?(player.calc_points)
      player_burst
    else
      dealer_turn

      if dealer.burst?(dealer.calc_points)
        dealer_burst
      elsif player.calc_points > dealer.calc_points
        player_win
      elsif dealer.calc_points > player.calc_points
        player_lose
      else
        tie_game
      end
      puts 'ブラックジャックを終了します。'
    end
  end

  # ブラックジャックゲームをプレイする
  def play
    initial_cards
    start

    loop do
      player.confirm_draw

      key_input = gets.chomp.upcase
      break if key_input == 'N'

      player.draw(deck.deal) if key_input == 'Y'
      break if player.burst?(player.calc_points)
    end
    judge
  end
end

GameDirector.new.play
