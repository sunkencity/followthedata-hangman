require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'followthedata_hangman_player/followthedata_hangman_player'

describe FollowthedataHangmanPlayer::FollowthedataHangmanPlayer do

  it "should be instantiable with no paramters" do

    lambda { FollowthedataHangmanPlayer::FollowthedataHangmanPlayer.new }.should_not raise_error

  end

  it "win game" do
    lambda {
      p = FollowthedataHangmanPlayer::FollowthedataHangmanPlayer.new
      p.word_list = %w{foo bar baj}
      p.new_game(6)
      p.guess("___", 5)
      p.incorrect_guess("e")
      p.guess("___", 4)
      p.correct_guess("a")
      p.correct_guess("b")
      p.correct_guess("j")
      p.game_result("result", "baj")
    }.should_not raise_error
  end

end
