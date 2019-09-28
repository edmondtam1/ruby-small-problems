class Diamond
  ALPHABET = [*'A'..'Z']
  
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    result = []
    index = ALPHABET.index(letter)
    ALPHABET.each_with_index do |c, i|
      built_line = build_line(c, index, i)
      if c == 'A'
        2.times { |_| result << built_line }
        next
      end
      result.insert(i, built_line)
      result.insert((-i - 1), built_line) if letter != c
      break if c == letter
    end

    result.join("\n") + "\n"
  end

  def self.build_line(char, index, current_i)
    return 'A'.center(index * 2 + 1) if char == 'A'
    spaces = index - current_i
    " " * spaces + char + " " * (2 * current_i - 1) + char + " " * spaces
  end
end
