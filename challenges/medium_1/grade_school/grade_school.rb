class School
  def initialize
    @school = Hash.new()
  end

  def to_h
    @school.sort.each_with_object({}) { |arr, hsh| hsh[arr[0]] = arr[1].sort }
  end

  def add(name, grade)
    @school[grade] = [] if !@school[grade]
    @school[grade] << name
  end

  def grade(grade)
    return [] if !@school[grade]
    @school[grade]
  end
end
