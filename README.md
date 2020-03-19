# SimpleEncryptable

SimpleEncryptable is based on Rails encryption mechanisms, it is streamline without all the bells and whistles, only the esentials. Heavilly inspired by [Pawel Urbanek](https://pawelurbanek.com/rails-secure-encrypt-decrypt).

## Installation

Add SimpleEncryptable application's Gemfile:

```ruby
gem 'simple_encryptable'
```
or
```ruby
gem 'simple_encryptable', '~> 0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_encryptable

## Usage
With `ActiveRecord` objects, the database must have `encrypted_[attribute]` column(s). With `PORO` objects, `attr_accessor [attribute]` must be provided.

You must include `SimpleEncryptable`, it is not dynamically loaded into all `ActiveRecord` objects. Providing `secret` and `salt` tokens is crutial. Ideally store them in an .env file or using Rails credentials mechanism.

```ruby
  class User
    include SimpleEncryptable

    attr_encryptable :secret_attribute, :another_secret_attribute, secret: 'foo', salt: 'bar'
  end
```

## Contributing

1. [Fork it](https://help.github.com/articles/about-forks/)
2. Clone the project `git clone git@github.com:[YOUR GITHUB USERNAME]/simple_encryptable.git`
3. `cd simple_encryptable`
4. Install dependencies, `bundle install`
5. Create your feature branch `git checkout -b my-new-feature`
6. Write your feature, along with tests for your changes
7. Run the tests `rake test`, all must be green
8. Commit your changes `git commit -am 'Added some feature'`
9. Push to the branch `git push origin my-new-feature`
10. Create new [Pull Request](https://help.github.com/articles/creating-a-pull-request/)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
