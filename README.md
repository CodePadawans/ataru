[![Build Status](https://travis-ci.com/mvz/ataru.svg?branch=master)](https://travis-ci.com/mvz/ataru)

# Ataru

Ataru is a gem that provides a command line tool for testing code samples in the documentation files.
You can also integrate ataru in your continuous integration process on Travis CI.

Ataru will check if your documentation is still in sync with the application it was written for.
The output of the results has the MiniTest style.

## What can ataru check

- Ataru can read files written in Github Flavoured Markdown, as it uses Kramdown with Github Flavoured Markdown Parser.

- Ataru is currently able to test the Ruby code only.
It checks the Ruby syntax and implements assertions (`assert_equal`) in place of `#=>` and `# =>`.

## Requirements

- The dependencies of your gem have to be in the range of the latest major versions of:

    - minitest (~> 5.0)
    - kramdown (~> 1.3)
    - thor (~> 0.20.0)

- In most cases, you need to create the setup file (for more info read Setup section).

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

If this is a file called `example.md`:

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

which renders as:

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

Check it with ataru:

```sh
 $ ataru check example.md
Run options: --seed 33946

# Running:

F

Finished in 0.001232s, 811.9236 runs/s, 811.9236 assertions/s.

  1) Failure:
#<Class:0x000000033451b8>#test_example_0 [example.md:10]:
Expected: true
  Actual: false

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
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

4. In your `.travis.yml` file add:
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
What is more, in that file you can write some setup code, that will be run before (and after, shall you want that) each snippet.
If you'd like to use instance variables, define them in `setup` method.
If you'd like to clean up after running tests, write your clean up code in `teardown` method.
If you like local variables, you can use methods (see example below).

#### Example

This is `ataru_setup.rb` file for an imaginary gem `my_fancy_lib`, where instance and local variables `@number` and `number` are defined:

```ruby
require 'my_fancy_lib'

module Setup
def setup
  @number = 21
end

def teardown
end

def number
  12
end
```

which allows us to use them in the code snippets in `README.md` file:

    ```ruby
    assert_equal @number + 1, 22
    ```

    ```ruby
    assert_equal number + 1, 13
    ```

Ataru comes with an easy to use generator for creating the setup file. When the generator process is finished, created
file is automatically passed to ataru.

To create the setup file execute:

  ```sh
  $ bundle exec ataru setup
  ```

Open created file in your text editor, do your requires and, optionally, write some setup code.
Save the file.

## Contributing

1. Fork it ( http://github.com/ataru/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request`
