class Element
  attr_reader :datum, :next

  def initialize(value, next_elem = nil)
    @datum = value
    @next = next_elem
  end

  def tail?
    @next == nil
  end
end

class SimpleLinkedList
  attr_reader :head

  def push(value)
    @head = @head ? Element.new(value, @head) : Element.new(value)
  end

  def empty?
    @head == nil
  end

  def peek
    head.nil? ? nil : head.datum
  end

  def pop
    value = head.datum
    @head = head.next
    value
  end

  def size
    self.to_a.size
  end

  def to_a
    result = []
    node = @head
    until node.nil?
      result << node.datum
      node = node.next
    end
    result

  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def self.from_a(arr)
    l = SimpleLinkedList.new
    arr.reverse.each { |v| l.push(v) } if arr.is_a?(Array)
    l
  end
end
