require 'date'

class Meetup
  DAY_MAPPING = { monday: 1, tuesday: 2, wednesday: 3,
  thursday: 4, friday: 5, saturday: 6, sunday:7 }

  def initialize(month, year)
    @month = month
    @year = year
    @schedule_values = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
  end

  def day_old(weekday, schedule)
    cwday_diff = (DAY_MAPPING[weekday] - @date.cwday) % 7
    last_date = (@date.next_month - 1).day
    weekday_dates = []
    0.upto(4) do |i|
      weekday_date = cwday_diff + 1 + i*7
      weekday_dates << weekday_date if weekday_date <= last_date
    end
    chosen_date = case schedule
    when :first then weekday_dates[0]
    when :second then weekday_dates[1]
    when :third then weekday_dates[2]
    when :fourth then weekday_dates[3]
    when :last then weekday_dates[-1]
    when :teenth
      (13..19).include?(weekday_dates[1]) ? weekday_dates[1] : weekday_dates[2]
    end

    Date.new(@year, @month, chosen_date)
  end

  def day(weekday, schedule)
    first_day = Date.new(@year, @month, @schedule_values[schedule])
    (first_day..(first_day + 6)).detect { |day| day.public_send(weekday.to_s + "?") }
  end
end
