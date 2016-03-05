require 'spec_helper'

describe BankWorkingDay do
  it 'has a version number' do
    expect(BankWorkingDay::VERSION).not_to be nil
  end

  describe '.end_of_month_without_holiday' do
    subject { BankWorkingDay.end_of_month_without_holiday(year: year, month: month) }

    context 'when year and month was given' do
      let(:year) { 2016 }
      let(:month) { 3 }
      it { is_expected.to eq Date.new(2016, 3, 31) }
    end

    context 'when end of month is holiday' do
      let(:year) { 2016 }
      let(:month) { 4 }
      it { is_expected.to eq Date.new(2016, 4, 28) }
    end

    context 'when year-end and new-year' do
      let(:year) { 2012 }
      let(:month) { 12 }
      it { is_expected.to eq Date.new(2012, 12, 28) }
    end
  end
end
