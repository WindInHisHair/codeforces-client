# CodeforcesClient

Tool for [codeforces](http://codeforces.com) contest.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codeforces_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeforces_client

## Usage

go to the directory where you want to put contests files, such as ```/home/user/contest```

run
```
codeforces_client CONTEST_ID PROBLEM_INDEX
```
**CONTEST_ID** can be found from the contest url, like *http://codeforces.com/contest/611/problem/a*, contest id is **611**, problem index is **A**

The above command will create a directory under current directory using CONTEST_ID as name, and generate sample test file inside it.

```
cd CONTEST_ID
```
CODIND and FIGHTING your contest


```
codeforces_client_test  PROBLEM_INDEX
```
then the sample test provided by the Codeforces website will be verified.

You can also manually add new sample test by following the sample test file format.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/codeforces_client.

