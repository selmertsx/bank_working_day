require 'active_support'
require 'active_support/core_ext'
require 'bank_working_day/version'
require 'bank_working_day/holidays'

module BankWorkingDay
  class InvalidArgumentError < StandardError; end

  class BankWorkingDay
    attr_accessor :holidays

    def initialize(holidays_yml_path='../../../holidays.yml')
      @holidays ||= Holidays.new(holidays_yml_path)
    end

    def end_of_month_without_holiday(date)
      date.end_of_month.day.downto(1) do |last_day|
        last_day = Date.new(date.year, date.month, last_day)
        return last_day unless holiday?(last_day)
      end
    end

    def working_day_before(date: , offset: )
      offset.times do |i|
        date -= 1
        date -= 1 while holiday?(date)
      end

      date
    end

    def working_day_after(date: , offset: )
      offset.times do |i|
        date += 1
        date += 1 while holiday?(date)
      end

      date
    end

    def deduction_date(year: , month: , day: 27)
      raise InvalidArgumentError if year.to_i.zero? || month.to_i.zero?

      date = Date.new(year.to_i, month.to_i, day.to_i)
      while holiday?(date)
        date += 1
      end

      date
    end

    def holiday?(date)
      holidays.holiday?(date)
    end
  end
end
