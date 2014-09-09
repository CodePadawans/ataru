| Project         | Ataru
|:----------------|:--------------------------------------------------
| CI              | [![Build Status](https://travis-ci.org/CodePadawans/ataru.svg?branch=master)](https://travis-ci.org/CodePadawans/ataru)
| Gem Version     | [![Gem Version](https://badge.fury.io/rb/ataru.svg)](http://badge.fury.io/rb/ataru)

# Ataru

Ataru is a command line tool for testing code samples in the documentation files.
If you are using Travis CI for continuous integration, you can include ataru in that process and check if your documentation is still in
sync with the application it was written for.

Ataru can read files written in Markdown. Other formats are not supported yet.
You can test more than one Markdown file at once.
The output of the results has MiniTest style.

## Requirements

The user has to be aware of the following:

1. Ataru is currently able to test the Ruby code only.

2. Ataru uses Kramdown with Github Flavoured Markdown Parser. That means ataru reads GFM files. 

3. If there are any dependencies needed for the code samples in the documentation files to run properly, the user has to provide a separate setup file. Please read the Setup chapter below for more information.

##Setup

For ataru to test not self-contained code, the user has to provide a specific setup file. It contains all the dependencies. The content of 
the setup file depends on the kind of application/ gem to be tested.

###Using generator for the setup file

Ataru provides the user with an easy to use generator for creating the setup file. The generator enables collecting all important information
in an easy way. When the generator process is finished, the setup file is automatically created and ready to pass to ataru. 

## Installation

Add this line to your application's Gemfile:

    gem 'ataru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ataru

## Usage

###How to use ataru from command line

To run ataru type:
```
ataru gogo FILENAMES (list of Markdown files with the correct path, e.g. home/project/foo/bar/bar.md)
```
###How to use ataru with Travis CI

You can integrate ataru in your continuous integration process. All you need is to add atatu to your Rakefile.

```
here comes code snippet
```


## Contributin important information

1. Fork it ( http://github.com/<my-github-username>/ataru/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
