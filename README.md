| Project         | Ataru
|:----------------|:--------------------------------------------------
| CI              | [![Build Status](https://travis-ci.org/CodePadawans/ataru.svg?branch=master)](https://travis-ci.org/CodePadawans/ataru)
| Gem Version     | [![Gem Version](https://badge.fury.io/rb/ataru.svg)](http://badge.fury.io/rb/ataru)

# Ataru

Ataru is a command line tool for testing the code samples in your documnetation.
If you are using Travis for continous integration test, you can also run Ataru to see, if your documentation is still valid.

Ataru can read you documentation that is written in markdown. Other formats are not supported yet.
You can test more than one markdownfile at once.
The output of the results has MiniTest style.


## Functionality:
TO DO 

## Requirements
The user has to be aware of:

1. The user has to adapt our requirements if he wants to use Ataru.

2. Testcases have to bring all context that is needed for the codesample to be executed.

3. Markdownfiles and files that contain specific information for testing the Markdownfile have to follow a name convention:
<name_of_md_file>.md => <name_of_md_file_test>



## Installation

Add this line to your application's Gemfile:

    gem 'ataru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ataru

## Usage

To run Ataru type:
```
ataru gogo FILENAMES (list of markdown files with the correct path, e.g. home/project/foo/bar/bar.md)
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ataru/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
