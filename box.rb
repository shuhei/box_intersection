require 'bundler/setup'

class Box
  attr_reader :x, :y, :z, :w, :h, :d

  def initialize(x, y, z, w, h, d)
    raise ArgumentError, 'Arguments must be integers.' unless integers?(x, y, z, w, h, d)
    raise ArgumentError, 'Sizes must be positive.' unless w > 0 && h > 0 && d > 0
    @x = x
    @y = y
    @z = z
    @w = w
    @h = h
    @d = d
  end

  def intersect?(b)
    overlap?(x, x + w, b.x, b.x + b.w) &&
      overlap?(y, y + h, b.y, b.y + b.h) &&
      overlap?(z, z + d, b.z, b.z + b.d)
  end

  private
    def integers?(*args)
      args.inject(true) { |result, num| result && num.kind_of?(Integer)  }
    end
    
    def overlap?(min1, max1, min2, max2)
      raise ArgumentError unless min1 <= max2 && min2 <= max2
      !(max1 <= min2 || max2 <= min2)
    end
end

