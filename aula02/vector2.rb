class Vector2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def *(multiplier)
    case multiplier
    when Vector2
      return @x * multiplier.x + @y * multiplier.y
    when Numeric
      return Vector2.new(@x * multiplier, @y * multiplier)
    else
      raise TypeError, "Unsupported multiplier type: #{multiplier.class}"
    end
  end

  def coerce(multiplicand)
    [self, multiplicand] if multiplicand.is_a?(Numeric)
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

v = Vector2.new(3, 4)

puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: (7.5, 10.0)