# # 1

# def ascii_value(str)
#   sum = 0
#   str.chars.each {|n| sum += n.ord }
#   sum
# end

# # char.ord.chr returns the original char

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# 2
# key here is that modulo operator on negative number works from next multiple
# of the divisor that is smaller than argument passed in

# def time_of_day1(int)
#   total_mins = int % (60 * 24)
#   hours, mins = total_mins.divmod(60)
#   format('%02d:%02d', hours, mins)
# end

SECONDS = 60
MINUTES = 60
HOURS = 24
DAYS_IN_WEEK = 7
MINUTES_PER_DAY = MINUTES * HOURS
MINUTES_IN_WEEK = MINUTES * HOURS * DAYS_IN_WEEK

# def time_of_day_week(int)
#   t = Time.gm(2018, 10, 13)
#   delta = int * SECONDS
#   (t + delta).strftime('%A %H:%M')
# end

# # p time_of_day(0) == "00:00"
# # p time_of_day(-3) == "23:57"
# # p time_of_day(-61) == "22:59"
# # p time_of_day(35) == "00:35"
# # p time_of_day(-1437) == "00:03"
# # p time_of_day(3000) == "02:00"
# # p time_of_day(800) == "13:20"
# # p time_of_day(-4231) == "01:29"

# p time_of_day_week(3000)

# # 3 somewhat difficult to conceptualise the 24 hour day

# def after_midnight(str)
#   hours = str[0..1].to_i % 24
#   mins = str[-2..-1].to_i
#   hours * MINUTES + mins
# end

# def before_midnight(str)
#   delta = MINUTES_PER_DAY - after_midnight(str)
#   delta = 0 if delta == MINUTES_PER_DAY
#   delta
# end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# # 4

# def swap(str)
#   arr = str.split(' ').map do |word|
#     first = word[0]
#     word[0] = word[-1]
#     word[-1] = first
#     word
#   end
#   arr.join(' ')
# end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# 5
# to write this again, probably use 

ALPHABET = [*'a'..'z', *'A'..'Z']
def cleanup(str)
  str.gsub!(/[^A-Za-z0-9]+/, ' ')
  # str.chars.map { |char| ALPHABET.include?(char) ? char : ' '}.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '

# easy_5: 6

def word_sizes1(str)
  hsh = {}
  arr = str.split(' ').each do |word|
    if hsh[word.size]
      hsh[word.size] += 1
    else
      hsh[word.size] = 1
    end
  end
  hsh
end

p word_sizes1('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes1('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes1("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes1('') == {}

# easy_5: 7
# can use delete

def word_sizes2(str)
  ans = str.split(' ').map do |word|
    word.gsub(/[^ a-zA-Z]/, '')
  end

  word_sizes1(ans.join(' '))
end

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}



# easy_5: 8

NUMBER_IN_TEXT = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort1(arr)
  arr.sort_by do |n|
    NUMBER_IN_TEXT[n]
  end
end

def alphabetic_number_sort(arr)
  new_arr = arr.map do |n|
    NUMBER_IN_TEXT[n]
  end
  mid_arr = new_arr.sort
  mid_arr.map {|word| NUMBER_IN_TEXT.index(word)}
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]




# easy_5: 9

def crunch(str)
  return '' if str == ''
  res = ''
  last = str[0]
  res << last
  str.chars.each do |x|
    if x == last
      next
    else
      last = x
      res << last
    end
  end
  res
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''




# easy_5: 10

def print_in_box(str)
  horizontal = "+#{'-' * (str.size + 2)}+"
  empty = "|#{' ' * (str.size + 2)}|"
  puts horizontal
  puts empty
  puts "| #{str} |"
  puts empty
  puts horizontal

end

print_in_box('To boldly go where no one has gone before.')




