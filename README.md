# InstanceVariableTracer

To trace assignment to instance variable. This is experimental implement.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instance_variable_tracer'
```

And then execute:

  $ bundle

Or install it yourself as:

  $ gem install instance_variable_tracer

## Usage

```ruby
InstanceVariableTracer.start(target_instance_variable_name: "@books")
```

When @books instance variable is assign, this InstanceVariableTracer print logs like this (using p method).

```
@books is assigned in path_to_app/app/controllers/books_controller.rb:7 index BooksController
```

## Development

The main file is lib/instance_variable_tracer.rb

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/igaiga/instance_variable_tracer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InstanceVariableTracer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/igaiga/instance_variable_tracer/blob/master/CODE_OF_CONDUCT.md).
