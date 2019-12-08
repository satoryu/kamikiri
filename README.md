# Kamikiri

Kamikiri is a command-line XML/HTML processor to extract parts of a given XML/HTML document.

## Installation

    $ gem install kamikiri

## Usage

This cli requires two options, `--file` and `--xpath`:

    kamikiri --file /path/to/xml/file.xml --xpath '//foo/bar'

Here is an example to extract CD informatoin whose price is higher than $10 and released in 1980s from [the catalog](https://www.w3schools.com/xml/cd_catalog.xml):

    $ kamikiri --file https://www.w3schools.com/xml/cd_catalog.xml --xpath '//CD[PRICE > 10.0]'
    <CD>
    <TITLE>Empire Burlesque</TITLE>
    <ARTIST>Bob Dylan</ARTIST>
    <COUNTRY>USA</COUNTRY>
    <COMPANY>Columbia</COMPANY>
    <PRICE>10.90</PRICE>
    <YEAR>1985</YEAR>
    </CD>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satoryu/kamikiri. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Kamikiri project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/satoryu/kamikiri/blob/master/CODE_OF_CONDUCT.md).
