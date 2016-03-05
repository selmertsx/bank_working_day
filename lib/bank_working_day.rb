require 'active_support'
require 'active_support/core_ext'
require 'bank_working_day/version'
require 'bank_working_day/holidays'
require 'pry'


module BankWorkingDay
  def self.end_of_month_without_holiday(year: , month: )
    end_of_month = Date.new(year, month).end_of_month

    end_of_month.day.downto(1) do |last_day|
      last_day = Date.new(end_of_month.year, end_of_month.month, last_day)
      return last_day unless holidays.holiday?(last_day)
    end
  end

  private

  def self.holidays
    @holidays ||= Holidays.new
  end
end
