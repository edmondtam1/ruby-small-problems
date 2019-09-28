class Bst
  attr_reader :data, :left, :right
  
  def initialize(value)
    @data = value
  end

  def insert(value)
    if value > @data
      @right == nil ? @right = Bst.new(value) : @right.insert(value)
    else
      @left == nil ? @left = Bst.new(value) : @left.insert(value)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    @left.each(&block) if @left
    yield(@data)
    
    @right.each(&block) if @right
    self
  end

end

tree = Bst.new 4
[2, 9, 3, 6, 7, 5].each { |x| tree.insert x }
# each_enumerator = tree.each
# print each_enumerator.next
print a = tree.each
print a.next
print a.next
print a.next
print a.next
print a.next
print a.next
print a.next
