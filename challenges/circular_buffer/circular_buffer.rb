class CircularBuffer

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @size = size
    @buffer = Array.new(@size)
    @read_index = 0
    @write_index = 0
  end

  def read
    raise BufferEmptyException if @buffer.all?(&:nil?)
    result, @buffer[@read_index] = @buffer[@read_index], nil
    @read_index = increment(@read_index)
    result
  end

  def write(value)
    raise BufferFullException if @buffer.none?(&:nil?)
    return if value.nil?
    @buffer[@write_index] = value
    @write_index = increment(@write_index)
  end

  def write!(value)
    return if value.nil?
    @read_index = increment(@read_index) unless @buffer.any?(&:nil?)
    @buffer[@write_index] = value
    @write_index = increment(@write_index)
  end

  def clear
    @buffer = Array.new(@size)
    @read_index = 0
    @write_index = 0
  end

  def increment(index)
    index == @size - 1 ? 0 : index + 1
  end
end
