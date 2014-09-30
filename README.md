| Project         | Ataru
|:----------------|:--------------------------------------------------
| CI              | [![Build Status](https://travis-ci.org/CodePadawans/ataru.svg?branch=master)](https://travis-ci.org/CodePadawans/ataru)
| Gem Version     | [![Gem Version](https://badge.fury.io/rb/ataru.svg)](http://badge.fury.io/rb/ataru)

# Ataru

Ataru is a gem that provides a command line tool for testing code samples in the documentation files.
You can also integrate ataru in your continuous integration process on Travis CI.

Ataru will check if your documentation is still in sync with the application it was written for.
The output of the results has the MiniTest style.

## What can ataru check

- Ataru can read files written in Github Flavoured Markdown, as it uses Kramdown with Github Flavoured Markdown Parser.

- Ataru is currently able to test the Ruby code only.

## Requirements

- The dependencies of your gem have to be in the range of the latest major versions of:

    - minitest (~> 5.0)
    - kramdown (~> 1.0)
    - thor (~> 0.1)

- You need to create the setup file (for more info read Setup section).

## Usage as command line tool

1. Add ataru to your project Gemfile.

2. From the top level of your project execute:

  ```sh
  $ bundle install
  ```

3. To create the setup file (for more info read Setup section) execute:
  ```sh
  $ bundle exec ataru setup
  ```

4. Finally, execute:
    - in case you want to check all the markdown files from your project:
    
    ```sh
    $ bundle exec ataru check
    ```
    - in case you want to check only specific markdown files from your project:

    ```sh
    $ bundle exec ataru check PROJECT_ROOT/foo/bar/filename_1.md PROJECT_ROOT/foo/bar/filename_2.md
    ```
5. Check the results.

## Example

If this is a file called eg1.md:

    LOOK AT THE THING

    ```ruby
    def bad
      false
    end

    def good
      true
    end

    bad #=> true
    good #=> true
    ```

## Workflow with Travis CI

1. Add ataru to your project Gemfile.

2. From the top level of your project execute:

  ```sh
  $ bundle install
  ```

3. To create the setup file (for more info read Setup section) execute:

  ```sh
  $ bundle exec ataru setup
  ```

4. In your .travis.yml file add:
    - in case you want to check all the markdown files from your project:
    
    ```
      script:
      - bundle exec rake build
      - bundle exec rake ataru check
    ```
    - in case you want to check only specific markdown files from your project:
    ```
    script:
    - bundle exec rake build
    - bundle exec ataru check PROJECT_ROOT/foo/bar/filename_1.md PROJECT_ROOT/foo/bar/filename_2.md
    ```
5. Now you can commit and push the changes to github.
6. Check the results of your build. 


## Setup

The setup file has to be created in order to enable ataru to read your project source code and use it for its checks.
What is more, in that file you can write some setup code, that will be run before (and possibly after) each snippet.
If you'd like to use instance variables, define them in `setup` method.
If you'd like to clean up after running tests, write in `teardown` method.
If you like local variables, you can use methods.

#### Example

If this is the ataru_setup.rb file for a fancy project:

    #require 'my_fancy_lib'
    
    module Setup
    def setup
        @number = 21
    end

    def teardown
    end    

    def number
        12
    end
    
And this is README.md for that fancy project:

    #if you like instance variables define them in #setup
    
    ```ruby
    assert equal @number + 1, 22
    ```
    #if you like local variables you can use methods
    
    ```ruby
    assert equal number + 1, 13
    ```

Ataru comes with an easy to use generator for creating that file. When the generator process is finished, the created
setup file is automatically passed to ataru.

To create the setup file execute:

  ```sh
  $ bundle exec ataru setup
  ```

Open created file in your text editor and write:

  ```
  require 'my_fancy_lib'
  ```

Save the file.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ataru/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request`
