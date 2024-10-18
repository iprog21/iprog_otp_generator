# Iprog OTP Code Generator

<img src="https://github.com/IPROG-TECH/media-files/blob/main/iprogtech-logo.png" width="150" alt="IPROG TECH" align="right" />

This gem is provided by [**IPROG TECH**](https://www.iprog.tech/), an information technology company specializing in web development services using Ruby on Rails. IPROG TECH also offers free programming tutorials.

**Providing Good Quality Web Services:**
- Startup
- Maintenance
- Upgrading & Conversion


<a href="https://www.buymeacoffee.com/iprog21" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Installation

To install the gem, add this line to your application's Gemfile:
```ruby
gem 'iprog_otp_generator'
```

And then execute:
```ruby
$ bundle install
```

Or install it yourself as:
```ruby
$ gem install iprog_chatgpt
```

## Generate Migration File
```ruby
$ rails generate iprog_otp_generator:install MODEL
```

## Run migration
```ruby
$ rails db:migrate
```

## Initialization
```ruby
app/models/user.rb

class User < ApplicationRecord
 enable_otp
end
```

## Usage

**Generate new OTP Code**
```ruby
user = User.take
user.generate_otp_code

or 

user.generate_otp_code(10)
```
`default length parameter: 8`

---

**Validate OTP Code**
```ruby
user = User.take
code = 12351234

user.valid_otp_code?(code)
```

---

**Reset OTP Code**
```ruby
user = User.take

user.clear_otp_code
```


## Rspec Testing
Run Spec:
```ruby
$ rspec spec/iprog_otp_generator_spec.rb
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/iprog21/iprog_otp_generator.

## License
This gem is available as open source under the terms of the [MIT License](./LICENSE.txt).

## Code of Conduct
This project has adopted the [Contributor Covenant Code of Conduct](./CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to iprog.tech@gmail.com.
