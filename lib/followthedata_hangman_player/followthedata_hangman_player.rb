module FollowthedataHangmanPlayer
  class FollowthedataHangmanPlayer

    def new_game(guesses_left)
      @curr_dictionary = Array.new(@full_dictionary)
      @left = ('a'..'z').to_a
    end

    def guess(word, guesses_left)
      remove_from_dictionary_that_doesnt_match word
      guesses_left > 4 ? select_vocals : select_character_by_frequence
      @left.pop
    end
    
    def remove_from_dictionary_that_doesnt_match word
      matcher = Regexp.new("^#{word.gsub("_", ".")}$")
      @curr_dictionary.reject! { |w| !( matcher =~ w ) }
    end
    
    def select_vocals
      vocals = { "a" => 1, "e" => 0 }
      vocals.default = 10
      @left = @left.sort_by { |x| vocals[x] }
    end
    
    def select_character_by_frequence
      @r = Hash.new(0)
      character_frequency
      sort_characters
    end

    def sort_characters
      @left = @left.sort_by { |x| @r[x] || 0 }
    end

    def current_characters
      @curr_dictionary.join.split(//)
    end
    
    def character_frequency
      current_characters.each { |i| @r[i] = @r[i].next }
    end

    def word_list=(list) @full_dictionary = list end
    def incorrect_guess(guess) @curr_dictionary.reject! { |w| w.include? guess } end
    def correct_guess(guess) @curr_dictionary.reject! { |w| !w.include?(guess) } end
    def fail(reason) ; end
    def game_result(result, word); end

  end
end
