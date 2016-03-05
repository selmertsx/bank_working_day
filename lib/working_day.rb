require 'active_support'
require 'active_support/core_ext'
require 'working_day/version'
require 'working_day/holidays'
require 'pry'


module WorkingDay
  def self.end_of_month_without_holiday(year: , month: )
    end_of_month = Date.new(year, month).end_of_month
  end
end
