require 'active_support'
require 'active_support/core_ext'
require 'bank_working_day/version'
require 'bank_working_day/holidays'
require 'pry'


module BankWorkingDay
  def self.end_of_month_without_holiday(date)
    date.end_of_month.day.downto(1) do |last_day|
      last_day = Date.new(date.year, date.month, last_day)
      return last_day unless holidays.holiday?(last_day)
    end
  end

  def self.working_day_before(date: , offset: )
    offset.times do |i|
      date -= 1
      date -= 1 while holiday?(date)
    end

    date
  end

  def self.holiday?(date)
    holidays.holiday?(date)
  end

  private

  def self.holidays
    @holidays ||= Holidays.new
  end
end
