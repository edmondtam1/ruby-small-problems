class Triangle
  def initialize(rows)
    @rows = rows
  end

  def rows
    result = [[1]]
    last_row = []
    2.upto(@rows) do |r|
      temp = Array.new(r)
      temp[0], temp[-1] = 1, 1
      1.upto(temp.size - 2) do |i|
        temp[i] = last_row[i - 1] + last_row[i]
      end
      last_row = temp
      result << temp
    end

    result
  end

end
