class WordProblem
  OPERATORS = {'plus' => '+', 'minus' => '-', 'multiplied' => '*', 'divided' => '/'}

  # def initialize(question)
  #   @question = question
  # end

  # def answer
  #   @question[-1] == '?' ? @question = @question[0..-2] : raise(ArgumentError)
  #   words = @question.downcase.split(' ')
  #   raise ArgumentError if words[0] != "what" || words[1] != "is"
  #   result = words[2].to_i
  #   counter, num_next, op_next = 3, nil, nil
  #   while counter < words.length
  #     if words[counter].to_i.to_s == words[counter]
  #       num_next = words[counter].to_i
  #     elsif ['plus', 'minus'].include?(words[counter])
  #       op_next = words[counter]
  #     elsif ['multiplied by', 'divided by'].include?("#{words[counter]} #{words[counter + 1]}")
  #       op_next = words[counter]
  #       counter += 1
  #     else
  #       raise ArgumentError
  #     end
  #     counter += 1
  #     if num_next && op_next
  #       result = result.send OPERATORS[op_next], num_next
  #       num_next, op_next = nil, nil
  #     end
  #   end
  #   result
  # end

  def initialize question
    @numbers = question.scan(/-?\d+/).map(&:to_i)
    @operators = question.scan(/#{OPERATORS.keys.join('|')}/)

    raise ArgumentError if @numbers.empty? || @operators.empty? || @numbers.size <= @operators.size
  end

  def answer
    nums = @numbers.each
    @operators.reduce(nums.next) do |total, op|
      total.send OPERATORS[op], nums.next
    end
  end

end
