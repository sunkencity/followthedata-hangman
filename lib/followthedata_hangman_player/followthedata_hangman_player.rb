module FollowthedataHangmanPlayer
  class FollowthedataHangmanPlayer

    # You may initialize you player but the the initialize method must take NO paramters.
    # The player will only be instantiated once, and will play many games.
    def initialize
    end

    # Before starting a game, this method will be called to inform the player of all the possible words that may be
    # played.
    def word_list=(list)
      @original_word_list = list
    end

    # a new game has started.  The number of guesses the player has left is passed in (default 6),
    # in case you want to keep track of it.
    def new_game(guesses_left)
      @word_list = Array.new(@original_word_list)
      @left = ('a'..'z').to_a
    end

    # Each turn your player must make a guess.  The word will be a bunch of underscores, one for each letter in the word.
    # after your first turn, correct guesses will appear in the word parameter.  If the word was "shoes" and you guessed "s",
    # the word parameter would be "s___s", if you then guess 'o', the next turn it would be "s_o_s", and so on.
    # guesses_left is how many guesses you have left before your player is hung.
    def guess(word, guesses_left)
      matcher = Regexp.new("^#{word.gsub("_", ".")}$")
      @word_list.reject! { |w| !( matcher =~ w ) } 
      rating = @word_list.inject({}) { |r,w| w.split(//).each { |i| r[i] = (r[i] || 0) + 1  }; r }
      @left = @left.sort_by { |x| (guesses_left < 4) ? (rating[x] || -1) : (%w{a e i o u y}.include?(x) ? 10 : 0) }
      @left.pop
    end

    # notifies you that your last guess was incorrect, and passes your guess back to the method
    def incorrect_guess(guess)
      @word_list.reject! { |w| w.include? guess }
    end

    # notifies you that your last guess was correct, and passes your guess back to the method
    def correct_guess(guess)
      @word_list.reject! { |w| !w.include?(guess) }
    end

    # you lost the game.  The reason is in the reason parameter
    def fail(reason)
    end

    # The result of the game, it'll be one of 'win', 'loss', or 'fail'.
    # The spelled out word will be provided regardless of the result.
    def game_result(result, word)
    end
    
  end
end