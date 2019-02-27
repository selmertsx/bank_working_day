# BankWorkingDay

日本の銀行に関して、その休日を把握しやすくするためのgem.
[holiday_jp](https://github.com/komagata/holiday_jp)をベースに、作っています.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bank_working_day'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bank_working_day

## Usage

#### 初期化

```ruby
bank_working_day = BankWorkingDay::Base.new()
```

祝日の情報をオーバーライドしたい場合はYAMLファイルのパスを渡す

```ruby
bank_working_day = BankWorkingDay::Base.new('/path/to/holidays.yml')
```

#### 銀行における月の最終営業日を返す

```ruby
bank_working_day.end_of_month_without_holiday(date)
```

#### x営業日前の日付を返す

```ruby
bank_working_day.working_day_before(date: date, offset: offset)
```

#### 休日か確認する

```ruby
bank_working_day.holiday?(date)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/speee/bank_working_day. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
