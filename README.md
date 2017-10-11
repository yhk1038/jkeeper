# Jkeeper

**Save** *Hash or Array Data* to local **json file**

**Read** local *json file* to **Hash or Array**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jkeeper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jkeeper

## Usage
- More information are in [Here](http://www.rubydoc.info/gems/jkeeper/0.1.0/jkeeper).

### Jkeeper::Filer
#### **module for file manager**
  
  - To save file
     - method: **.save_json(data, \*arg)**
     - usage: `Jkeeper::Filer.save_json(your_data)`
     - [more options](http://www.rubydoc.info/gems/jkeeper/0.1.0/jkeeper) (eg. path etc.)
     
  - To read file
     - method: **.read(path)**
     - usage: `Jkeeper::Filer.read(your_data_file_path)`
     

### Jkeeper::Api
#### **module for API manager (REST)**
  
  - To get
     - method: **.get(url, \*arg)**
     - usage: `Jkeeper::Api.get('api_request_url')`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [Jkeeper Repo](https://github.com/yhk1038/jkeeper). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

버그 리포트와 풀리퀘스트를 언제든지 환영합니다. Issue를 남겨주세요! 테스트 작성, 기능 제안 및 수정 또는 확장, 코드 리펙토링 등 모든 주제에 대해 언제든지 Issue 를 통해 논의할 수 있습니다. 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jkeeper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yhk1038/jkeeper/blob/master/CODE_OF_CONDUCT.md).
