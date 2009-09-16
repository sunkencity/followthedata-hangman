module FollowthedataHangmanPlayer
  class FollowthedataHangmanPlayer

    A = [97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122]
    def new_game l
      @w = Array.new(@f)
      @l = Array.new(A)
      @r = Array.new(123, 0)
    end

    def guess w, l
      a w
      b
      @l.pop.chr
    end

    def a c
      m = Regexp.new('^' << c.gsub('_','.') << '$')
      @w.reject! { |w| m !~ w }
    end

    def b
      @r.fill(0)
      c
      @l = @l.sort_by { |x| @r[x] }
    end

    def c
      @w.join.each_byte { |i| @r[i] = @r[i].next }
    end

    def word_list=(l) @f = l end
    def incorrect_guess(g) @w.reject! { |w| w.include? g } end
    def correct_guess(g) @w.reject! { |w| !w.include?(g) } end
    def fail(r) ; end
    def game_result(r, w); end

  end
end
