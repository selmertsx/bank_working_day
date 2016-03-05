# -*- coding: utf-8 -*-
require 'yaml'

module BankWorkingDay
  class Holiday
    def initialize(date, name)
      @date = date
      @name = name
    end
  end

  class Holidays
    attr_accessor :holidays, :bank_holidays

    HOLIDAY_WDAYS = [0, 6].freeze

    def initialize
      @holidays = set_holiday('holidays.yml')
      @bank_holidays = set_holiday('bank_holidays.yml')
    end

    def holiday?(date)
      holidays[date] || bank_holidays[date] || date.wday.in?(HOLIDAY_WDAYS)
    end

    private

    def set_holiday(yml)
      yaml = YAML.load_file(File.expand_path("../../../#{yml}", __FILE__))
      yaml.each_with_object({}) do |(key, value), hash|
        hash[key] = Holiday.new(key, value)
      end
    end
  end
end
