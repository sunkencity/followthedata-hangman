module FollowthedataHangmanPlayer
  class FollowthedataHangmanPlayer

    AZ = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122]
    
    def new_game l
      @cf = Array.new(@fd)
      @lf = Array.new(AZ)
    end

    def guess w, l
      re w
      by_f
      @lf.pop.chr
    end

    def re c
      m = Regexp.new("^#{c.gsub("_", ".")}$")
      @cf.reject! { |w| !( m =~ w ) }
    end

    def by_f
      @r = Hash.new(0)
      char_f
      @lf = @lf.sort_by { |x| @r[x] }
    end

    def char_f
      @cf.join.each_byte { |i| @r[i] = @r[i].next }
    end

    def word_list=(l) @fd = l end
    def incorrect_guess(g) @cf.reject! { |w| w.include? g } end
    def correct_guess(g) @cf.reject! { |w| !w.include?(g) } end
    def fail(r) ; end
    def game_result(r, w); end

  end
end
