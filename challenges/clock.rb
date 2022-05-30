class Clock
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def +(minutes)
    self.hour, self.minute = calculate_time(minutes)
    self
  end

  def -(minutes)
    self.hour, self.minute = calculate_time(-minutes)
    self
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def ==(other)
    total == other.total
  end

  protected 
  
  def total
    hour*60 + minute
  end

  private

  attr_accessor :hour, :minute

  def calculate_time(minutes)
    minutes = total + minutes
    h, m = minutes.divmod(60)
    h %= 24
    [h, m]
  end
end
