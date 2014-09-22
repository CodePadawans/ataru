| Project         | Ataru
|:----------------|:--------------------------------------------------
| CI              | [![Build Status](https://travis-ci.org/CodePadawans/ataru.svg?branch=master)](https://travis-ci.org/CodePadawans/ataru)
| Gem Version     | [![Gem Version](https://badge.fury.io/rb/ataru.svg)](http://badge.fury.io/rb/ataru)

# Ataru

Ataru is a gem that provides a command line tool for testing code samples in the documentation files.
Ataru will check if your documentation is still in sync with the application it was written for.
The output of the results has the MiniTest style.

## What can ataru check

1. Ataru can read files written in Github Flavoured Markdown, as it uses Kramdown with Github Flavoured Markdown Parser.

2. Ataru is currently able to test the Ruby code only.

3. If there are any dependencies needed for the code samples in the documentation files to run properly, the user has to provide a separate
setup file. Please read the Setup section below for more information.

4. The dependencies of your gem have to be in the range of the latest major versions of:
- minitest (~> 5)
- kramdown (~> 1)
- thor (~> 0)

## Workflow

1. Add ataru to your Gemfile.

2. Go to your application folder and execute:

    `$ bundle`

3. If you need an ataru compatible setup file (see Setup section) execute:

    `$ bundle exec ataru setup`

4. Execute:

    `$ bundle exec ataru check [your Markdown files, with proper path, separated by empty space]`

5. Check the results.

## Workflow with Travis CI

1. Add ataru to your Gemfile.

2. In your .travis.yml file add...

- in case you want to check all the markdown files from your project:

    `script:
     - bundle exec rake build
     - bundle exec rake ataru check`

- in case you want to check only specific markdown files from your project:

    `script:
     - bundle exec rake build
     - bundle exec rake ataru check [your Markdown files, with proper path, separated by empty space]`

## Setup

For ataru to test not self-contained code, the user has to provide a specific setup file, which contains all the dependencies. The content
of the setup file depends on the kind of application/ gem to be tested.

Ataru comes with an easy to use generator for creating that file. When the generator process is finished, the setup file is automatically
created and ready to be automatically passed to ataru.

If you need an ataru compatible setup file execute:

    $ bundle exec ataru setup

Open created file in your text editor and write down all the dependencies needed for the code snippets.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ataru/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request`
