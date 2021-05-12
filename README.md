## Setup

  1. install ruby `2.6.6` version.
  2. run `bundle install`

  
## Execute script

To run parser type in command line:

```
./parse_log.rb *filename*
```

To run tests type in command line:

```
bundle exec rspec
```

## Architecture

The architecture is based on "sending a message" principal instead of using `if` statement. The main entry point of parsing interface is `LogFile` class. 
During initialization it requires file, parser and statistic calculator. The interface consists of 2 methods `all_visits` and 
`uniq_visits` which use dependency injection in order to sort and format data after calculations. They use default sorter and formatter in order to avoid extra 'ifs'.


