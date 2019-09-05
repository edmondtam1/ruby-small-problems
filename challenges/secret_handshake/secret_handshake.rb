class SecretHandshake
  COMMANDS = {
    1 => 'wink',
    10 => 'double blink',
    100 => 'close your eyes',
    1000 => 'jump',
    10000 => 'reverse'
  }

  def initialize(input)
    @value = convert_to_binary(input)
  end

  def convert_to_binary(input)
    begin
      value = Integer(input) if !!Integer(input)
    rescue ArgumentError, TypeError
      return "0"
    end
    binary_value = ""
    while value > 0
      value, rem = value.divmod(2)
      binary_value = rem.to_s + binary_value
    end
    binary_value
  end

  def commands
    return [] if @value == "0"
    result = []
    digit_position = 1
    @value.split('').reverse.each do |c|
      if digit_position == 5 && c == '1'
        result.reverse!
        break
      end
      if c == '1'
        result.append(COMMANDS[c.to_i * (10 ** (digit_position - 1))])
      end
      digit_position += 1
    end
    result
  end
end
