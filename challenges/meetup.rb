require 'date'

class Meetup
  DESCRIPTORS = {
    'first' => 0,
    'second' => 1,
    'third' => 2,
    'fourth' => 3,
    'fifth' => 4,
    'last' => -1,
    'teenth' => 0
  }
  RANGE = (1..31).to_a
  TEENTH = (13..19).to_a

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(week_day, descriptor)
    range = descriptor.downcase == 'teenth' ? TEENTH : RANGE
    dates = select_dates(range, week_day)
    day = dates[find_idx(descriptor.downcase)]
    day == nil ? nil : Date.civil(year, month, day)
  end

  private

  attr_reader :year, :month

  def select_dates(range, week_day)
    range.select do |day|
      next if !Date.valid_date?(year, month, day)
      Date.civil(year, month, day).send(week_day.downcase + '?')
    end
  end

  def find_idx(descriptor)
    DESCRIPTORS.find { |k, _| k == descriptor }[-1]
  end
end
