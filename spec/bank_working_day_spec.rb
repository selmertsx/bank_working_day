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

  describe '.holiday?' do
    subject { BankWorkingDay.holiday?(date) }

    context 'when Friday 2012/12/28 ' do
      let(:date) { Date.new(2012, 12, 28)}
      it { is_expected.to be_falsey }
    end

    context 'when Monday 2012/12/31' do
      let(:date) { Date.new(2012, 12, 31)}
      it { is_expected.to be_truthy }
    end

    context 'when 2016-04-29 昭和の日' do
      let(:date) { Date.new(2016, 4, 29)}
      it { is_expected.to be_truthy }
    end
  end
end
