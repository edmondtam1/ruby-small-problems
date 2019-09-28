class RunLengthEncoding
  def self.decode_old(input)
    result = ""
    counter = 0
    input.scan(/\d+|.{1}/).each do |char|
      if char.to_i.to_s == char
        counter = char.to_i
      else
        result += counter > 0 ? char * counter : char
        counter = 0
      end
    end
    result
  end

  # def self.encode_old(input)
  #   result = ""
  #   counter = 0
  #   input.chars.each_with_index do |c, i|
  #     if c == input[i - 1] || i == 0
  #       counter += 1
  #     else
  #       result += counter > 1 ? counter.to_s + input[i - 1] : input[i - 1]
  #       counter = 1
  #     end
  #   end
  #   result += counter > 1 ? counter.to_s + input[-1] : input[-1]
  # end

  # an elegant solution - key learning around use of \1, \2 in regex
  def self.encode(input)
    input.gsub(/(.)\1{1,}/) { |match| match.size.to_s + match[0] }
  end

  def self.decode(input)
    input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end
end
