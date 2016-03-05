require 'spec_helper'

describe WorkingDay do
  it 'has a version number' do
    expect(WorkingDay::VERSION).not_to be nil
  end

  context '.end_of_month_without_holiday' do
    subject { WorkingDay.end_of_month_without_holiday(year: year, month: month) }
    let(:year) { 2016 }
    let(:month) { 3 }

    it 'when year and month was given' do
      is_expected.to eq (31)
    end
  end
end
