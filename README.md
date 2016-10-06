# opts_validator
Validate the presence of CLI params the easy way

## Installation

You can install the gem:

```ruby
gem install opts_validator
```

Or add it as a dependency in your _Gemfile_

```ruby
gem 'opts_validator'
```

## Usage
Let's suppose that you want that your config requires a name parameter:
```ruby
options = {
    message: 'Hello',
}
options_validator = OptsValidator.new(options)
options_validator.validate_presence_of(:name, 'name', 'u')
# Error: You must provide the user name parameter (-u flag)
options_validator.validate_presence_of(:last_name, 'last name', 'l')
# Error: You must provide the last name parameter (-l flag)
```

You can also use a custom logger:
```ruby
require 'logger'

logger = Logger.new(STDOUT)
options_validator = OptsValidator.new(options, logger)
options_validator.validate_presence_of(:name, 'name', 'u')
# E, [2016-10-06T12:44:11.298273 #10275] ERROR -- : You must provide the name parameter (-u flag)
```
