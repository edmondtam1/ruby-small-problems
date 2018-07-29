
# def has_a_b?(string)
#   if string =~ /b/
#     puts "We have a match!"
#   else
#     puts "No match here."
#   end
# end

# has_a_b?("basketball")
# has_a_b?("football")
# has_a_b?("hockey")
# has_a_b?("golf")

# def test(b)
#   b.map {|letter| "I like the letter: #{letter}"}

# end

# a = ['a', 'b', 'c']
# test(a)
# puts a

# note: &block must always be the last argument in a method

# def take_block(&block)
#   block.call
# end

# take_block do
#   puts "Block being called in the method!"
# end


def take_block(number, &block)
  block.call(number)
end

number = 42   
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end

def take_proc(proc)
  [1, 2, 3, 4, "hi"].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)