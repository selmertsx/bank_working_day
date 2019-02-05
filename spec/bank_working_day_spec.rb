require 'spec_helper'

describe BankWorkingDay do
  let(:bank_working_day) { BankWorkingDay::Base.new }

  it 'has a version number' do
    expect(BankWorkingDay::VERSION).not_to be nil
  end

  describe '.end_of_month_without_holiday' do
    subject { bank_working_day.end_of_month_without_holiday(date) }
    let(:date) { Date.new(year, month) }

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
    subject { bank_working_day.holiday?(date) }

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

  describe '.working_day_before' do
    subject { bank_working_day.working_day_before(date: date, offset: offset) }

    context 'when Sunday 2016/4/30' do
      let(:date) { Date.new(2016, 4, 30) }
      let(:offset) { 3 }
      it { is_expected.to eq Date.new(2016, 4, 26) }
    end

    context 'when Friday 2016/3/4' do
      let(:date) { Date.new(2016, 3, 4) }
      let(:offset) { 3 }
      it { is_expected.to eq Date.new(2016, 3, 1) }
    end
  end

  describe '.working_day_after' do
    subject { bank_working_day.working_day_after(date: date, offset: offset) }

    context 'when 2016/4/27 and after 1 working day' do
      let(:date) { Date.new(2016, 4, 27) }
      let(:offset) { 1 }
      it { is_expected.to eq Date.new(2016, 4, 28) }
    end

    context 'when 2016/4/27 and after 2 working day' do
      let(:date) { Date.new(2016, 4, 27) }
      let(:offset) { 2 }
      it { is_expected.to eq Date.new(2016, 5, 2) }
    end

    context 'when 2016/4/27 and after 3 working day' do
      let(:date) { Date.new(2016, 4, 27) }
      let(:offset) { 3 }
      it { is_expected.to eq Date.new(2016, 5, 6) }
    end
  end

  describe '.aplus_deduction_date' do
    subject { bank_working_day.deduction_date(year: year, month: month, day: 27) }
    context 'when 2016/7/27 deduction date is 2016/7/27' do
      let(:year) { '2016' }
      let(:month) { '7' }
      it { is_expected.to eq Date.new(2016, 7, 27) }
    end

    context 'when 2016/8/27 deduction date is 2016/8/29' do
      let(:year) { '2016' }
      let(:month) { '8' }
      it { is_expected.to eq Date.new(2016, 8, 29) }
    end

    context 'when 2016/3/27 deduction date is 2016/3/28' do
      let(:year) { '2016' }
      let(:month) { '3' }
      it { is_expected.to eq Date.new(2016, 3, 28) }
    end

    context 'when invalid argument' do
      let(:year) { 'hoge' }
      let(:month) { 'huga' }
      it { expect { subject }.to raise_error BankWorkingDay::InvalidArgumentError }
    end
  end
end
