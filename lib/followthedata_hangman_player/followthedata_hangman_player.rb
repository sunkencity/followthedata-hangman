module FollowthedataHangmanPlayer
  class FollowthedataHangmanPlayer

    A = [106, 113, 120, 122, 119, 107, 118, 102, 98, 103, 121, 104, 100, 109, 112, 117, 99, 108, 115, 116, 110, 114, 111, 97, 105, 101]
    def new_game l
      @w = Array.new(@f)
      @l = Array.new(A)
      @r = Array.new(123, 0)
      @s = false
    end

    def guess w, l
      a w
      b if @s 
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
    def incorrect_guess(g) 
      @w.reject! { |w| w.include? g } 
      @s = true
    end
    def correct_guess(g) @w.reject! { |w| !w.include?(g) } end
    def fail(r) ; end
    def game_result(r, w); end

  end
end
