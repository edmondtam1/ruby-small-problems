class Robot
  @@names = {}

  def initialize
    @name = name(true)
    @reset = false
  end

  def name(reset=false)
    @name = reset ? generate_name : @name
  end

  def reset
    old_name = @name
    name(true)
    @@names.delete(old_name)
  end

  def generate_name
    result = ""
    loop do
      result = [*'AA'..'ZZ'].sample + sprintf("%03d", rand(0..999))
      break if !@@names.include?(result)
    end
    @@names[result] = true
    result
  end
end
