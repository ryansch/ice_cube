module IceCube

  class WeeklyRule < DailyRule
    
    # Determine whether or not this rule occurs on a given date.
    # Weekly rules occurs if we're in one of the interval weeks,
    # and we're in a valid day of the week.
    def in_interval?(date, start_date)
      #make sure we're in the right interval
      week_of_year = Date.civil(date.year, date.month, date.day).cweek
      week_of_year % @interval == 0
    end
    
    def to_ical 
      'FREQ=WEEKLY' << to_ical_base
    end
    
    protected
    
    def default_jump(date)
      date + 7 * ONE_DAY * @interval
    end

    private

    def initialize(interval)
      super(interval)
    end
     
  end

end
