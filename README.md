# Quack

Quack is a simple Ruby scalar type coercion library.

## Installation

Add this line to your application's Gemfile:

    gem 'quack'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quack

## Usage

Quack is able to guess the following type categories and cast values to appropriate built-in type:

- `Integer`
- `Float`
- `Time`
- `Boolean`
- `Null`
- `String`

### Integer

```ruby
value = Quack("123")
value.class
#=> Quack::Types::Integer
value.to_coerced
#=> 123
value.to_coerced.class
#=> Integer
```

### Integer (Ruby 2.3 and earlier)

```ruby
value = Quack("123")
value.class
#=> Quack::Types::Integer
value.to_coerced
#=> 123
value.to_coerced.class
#=> Fixnum
```

### Float

```ruby
value = Quack("29.4")
value.class
#=> Quack::Types::Float
value.to_coerced
#=> 29.4
value.to_coerced.class
#=> Float
```

### Time

```ruby
value = Quack("2014-03-22T03:00:00Z")
value.class
#=> Quack::Types::Time
value.to_coerced
#=> 2014-03-22T03:00:00+00:00
value.to_coerced.class
#=> Time
```

### Boolean

```ruby
value = Quack("true")
value.class
#=> Quack::Types::Boolean
value.to_coerced
#=> true
value.to_coerced.class
#=> TrueClass

value = Quack("false")
value.class
#=> Quack::Types::Boolean
value.to_coerced
#=> false
value.to_coerced.class
#=> FalseClass
```

### Null

```ruby
value = Quack(nil)
value.class
#=> Quack::Types::Null
value.to_coerced
#=> nil
value.to_coerced.class
#=> NilClass
```

### String

```ruby
value = Quack("foo")
value.class
#=> Quack::Types::String
value.to_coerced
#=> foo
value.to_coerced.class
#=> String
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
