class Series
  # def initialize(series)
  #   @series = series
  # end

  # def slices(size)
  #   raise ArgumentError, 'Your slice size is too high.' if size > @series.size
  #   result = []
  #   index = 0

  #   while index < @series.size + 1 - size
  #     chunk = []
  #     index.upto(index + size - 1) do |idx|
  #       chunk << @series[idx].to_i
  #     end
  #     result << chunk
  #     index += 1
  #   end
    
  #   result
  # end

  def initialize(numbers)
    @numbers = numbers.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError, 'Your size is too big!' if size > @numbers.size
    slices = @numbers.size - size + 1

    result = []

    0.upto(slices - 1) {|i| result << @numbers.slice(i, size)}

    result
  end
end