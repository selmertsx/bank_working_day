# -*- coding: utf-8 -*-
require 'yaml'

module WorkingDay
  class Holidays
    attr_accessor :holidays

    def initialize
      @holidays = {}
      yaml = YAML.load_file(File.expand_path('../../../holidays.yml', __FILE__))
      yaml.map do |key, value|
        @holidays[key] = Holiday.new(key, value)
      end
    end

    def holiday?(date)
      holidays[date]
    end
  end

  class Holiday
    def initialize(date, name)
      @date = date
      @name = name
    end
  end
end
