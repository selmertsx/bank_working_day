# -*- coding: utf-8 -*-
require 'yaml'

module WorkingDay
  class Holiday
    def initialize(date, name)
      @date = date
      @name = name
    end
  end

  class Holidays
    attr_accessor :holidays
    HOLIDAY_WDAYS = [0, 6].freeze

    def initialize
      @holidays = {}
      yaml = YAML.load_file(File.expand_path('../../../holidays.yml', __FILE__))
      yaml.map do |key, value|
        @holidays[key] = Holiday.new(key, value)
      end
    end

    def holiday?(date)
      holidays[date] || date.wday.in?(HOLIDAY_WDAYS)
    end
  end
end
