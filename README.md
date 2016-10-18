# Concrete
[![Build Status](https://travis-ci.org/wizardone/concrete.svg?branch=master)](https://travis-ci.org/wizardone/concrete)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'concrete_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install concrete_attributes

## Usage

Concrete gives you class level inheritance, similar to Rails
`class_attribute`, but the implementation is far less complex.
```ruby
class A
  extend ConcreteAttributes
  concrete_attribute :car
end
A.car = 'bmw'

class B < A
end
B.car
=> 'bmw'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wizardone/concrete. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
