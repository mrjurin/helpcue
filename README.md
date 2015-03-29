# [HelpCue](http://www.helpcue.com)

[![Code Climate](https://codeclimate.com/github/aomra015/helpcue/badges/gpa.svg)](https://codeclimate.com/github/aomra015/helpcue) [![Test Coverage](https://codeclimate.com/github/aomra015/helpcue/badges/coverage.svg)](https://codeclimate.com/github/aomra015/helpcue)

## Getting Started

The development environment requires the Ruby 2.2.1 and Postgresql. To get this set up please follow the instructions in the [Wiki](https://github.com/aomra015/helpcue/wiki) but make sure you upgrade everything.

1. `$ git clone git@github.com:aomra015/helpcue.git`
1. `$ cd helpcue`
1. `$ bin/setup`
1. `$ cp .env.example .env` -- Fill out the .env file with the appropriate environment variables.

### Start development environment (at localhost:5000)
- `$ foreman start`

### Run tests
- `$ rake` to run all Ruby tests.
