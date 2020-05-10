class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def to_s
    "#{'%02d' % @hours}:#{'%02d' % @minutes}"
  end
  
  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)  
  end

  def +(value)
    hour_delta = value.divmod(60)
    minute_delta = (hour_delta[1] + @minutes).divmod(60)
    @hours = (@hours + hour_delta[0] + minute_delta[0]).divmod(24)[1]
    @minutes = minute_delta[1]
    self
  end

  def -(value)
    self.+(-value)
  end

  def ==(other)
    to_s == other.to_s
  end
end
