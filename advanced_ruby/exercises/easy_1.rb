# 1

# class Tree
#   include Enumerable

#   def each

#   end

# end

# 2

# def compute(arg)
#   return yield + arg if block_given?
#   'Does not compute.'
# end

# p compute(4) { 5 + 3 } == 12
# p compute('sup') { 'a' + 'b' } == 'absup'
# p compute(:idea) == 'Does not compute.'

# 3

# def missing(arr)
#   result = []
#   # arr.first.upto(arr.last) do |i|
#   #   result << i unless arr.include? i
#   # end
#   counter = arr.first
#   while counter < arr.last
#     result << counter unless arr.include? counter
#     counter += 1
#   end
#   result
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# 4

# def divisors(int)
#   result = [int]
#   1.upto(int) do |i|
#     break if result.include? i
#     if int % i == 0
#       result << i
#       result << int / i
#     end
#   end
#   result.sort.uniq
#   # 1.upto(int).select do |i|
#   #   int % i == 0
#   # end
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357) == [1, 999979, 999983, 999962000357]

# 5

# def decipher_char(c)
#   case c
#   when 'a'..'m', 'A'..'M'
#     (c.ord + 13).chr
#   when 'n'..'z', 'N'..'Z'
#     (c.ord - 13).chr
#   else
#     c
#   end
# end

# def decipher_array(arr)
#   arr.map { |name| name.split('').map { |c| decipher_char (c) }.join }.sort
# end

# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze

# puts decipher_array(ENCRYPTED_PIONEERS)

# 6

# def any?(arr)
#   arr.each do |item|
#     return true if yield(item)
#   end
#   false
# end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# 7

# def all?(arr)
#   arr.each do |item|
#     return false unless yield(item)
#   end
#   true
# end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

# 8

# def none?(arr)
#   arr.each do |item|
#     return false if yield(item)
#   end
#   true
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# 9

# def one?(arr)
#   counter = 0
#   arr.each do |item|
#     counter += 1 if yield(item)
#     return false if counter > 1
#   end
#   counter == 1 ? true : false
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

# 10

def count(arr)
  count = 0
  arr.each do |item|
    count += 1 if yield(item)
  end

  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

