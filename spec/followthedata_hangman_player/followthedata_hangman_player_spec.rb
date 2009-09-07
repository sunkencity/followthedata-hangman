require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'followthedata_hangman_player/followthedata_hangman_player'

describe FollowthedataHangmanPlayer::FollowthedataHangmanPlayer do

  it "should be instantiable with no paramters" do

    lambda { FollowthedataHangmanPlayer::FollowthedataHangmanPlayer.new }.should_not raise_error

  end
  
  it "play game".should_not do
    lambda {
      p = FollowthedataHangmanPlayer::FollowthedataHangmanPlayer.new
      p.word_list = %w{foo bar baz}
      p.new_game(6)
      p.guess("___", 5)
    }.should_not raise_error
  end

end