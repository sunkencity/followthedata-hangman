module FollowthedataHangmanPlayer
  class FollowthedataHangmanPlayer

    def initialize
      @vocals = { "a" => 1, "e" => 0 }
      @vocals.default = 10
    end
    
    def new_game(guesses_left)
      @cf = Array.new(@fd)
      @left = ('a'..'z').to_a
    end

    def guess(word, gl)
      dict word
      gl > 3 ? by_v : by_f
      @left.pop
    end
    
    def dict word
      m = Regexp.new("^#{word.gsub("_", ".")}$")
      @cf.reject! { |w| !( m =~ w ) }
    end
    
    def by_v
      @left = @left.sort_by { |x| @vocals[x] } 
    end
    
    def by_f
      @r = Hash.new(0)
      char_f
      sort_l
    end

    def sort_l
      @left = @left.sort_by { |x| @r[x] }
    end

    def curr
      @cf.join.split(//)
    end
    
    def char_f
      curr.each { |i| @r[i] = @r[i].next }
    end

    def word_list=(l) @fd = l end
    def incorrect_guess(g) @cf.reject! { |w| w.include? g } end
    def correct_guess(g) @cf.reject! { |w| !w.include?(g) } end
    def fail(r) ; end
    def game_result(r, w); end

  end
end
