
## Screencast

[![](http://padrino.s3.amazonaws.com/screencast_1.png)](http://padrino.s3.amazonaws.com/screencast_1.mov)

There is also a screencast available for this tutorial. You can check it out by:

-   [Watching it on Vimeo](http://vimeo.com/10522357) (Low Resolution)
-   [Downloading the file](http://padrino.s3.amazonaws.com/screencast_1.mov) (211 Mb, 12:00 in [Quicktime](http://www.apple.com/quicktime/download))

There is a poll on [PeepCode](http://suggestions.peepcode.com/forums/15-general/suggestions/1064769-padrino) so please [VOTE](http://suggestions.peepcode.com/forums/15-general/suggestions/1064769-padrino) for our new [Screencast](http://suggestions.peepcode.com/forums/15-general/suggestions/1064769-padrino) !

 

## Study Guide

To skip this tutorial or immediately see the complete blog tutorial project, you can either checkout the [blog tutorial repository](http://github.com/padrino/sample_blog) using Git:

    $ git clone git://github.com/padrino/sample_blog.git

or even execute the [blog tutorial project template](http://gist.github.com/357045) which will automatically build the blog project step by step using our excellent template runner. You can do this simply by invoking:

    $ padrino g project sample_blog --template sampleblog

To learn more about our template generator, be sure to check out the the [generators guide](/guides/generators).

 

## Installation

In order to develop a Padrino application, we must have a few things installed. First, we must obviously have [ruby](http://www.ruby-lang.org/en/) and [rubygems](http://rubygems.org/) installed. Next, we must install the padrino framework gems:

    $ gem install padrino

For more details on installation, check out the [installation guide](/guides/installation). Once this has been finished, all necessary dependencies should be ready and we can begin developing our sample blog.

 

## Project Generation

To create a Padrino application, the best place to start is using the convenient Padrino generator. Similar to Rails, Padrino has a project generator which will create a skeleton application with all the files you need to being development of your new idea. Padrino is an agnostic framework and supports using a variety of different template, testing, JavaScript and database components. You can learn more by reading the [generators guide](/guides/generators).

For this sample application, we will use the ActiveRecord ORM, the Haml templating language, the Shoulda testing framework and the jQuery JavaScript library. With that in mind, let us generate our new project:

    $ padrino g project sample_blog -t shoulda -e haml -c sass -s jquery -d activerecord -b

This command will generate our basic Padrino project and the print out a nice report of the files generated. The output of this generation command can be viewed in [this gist](http://gist.github.com/337148) file. Notice the `-b` flag in the previous command which automatically instructs bundler to install all dependencies. All we need to do now is `cd` into our brand new application.

    $ cd sample_blog

Now, the terminal should be inside the root of our newly generated application with all necessary gem dependencies installed. Let us take a closer look at the particularly important generated files before we continue on with development.

-   `Gemfile` – Be sure to include any necessary gem dependencies for your app in this file!
-   `app/app.rb` – This is the primary configuration file for your core application.
-   `config/apps.rb` – This defines which applications are mounted in your project.
-   `config/database.rb` – This defines the connection details for your chosen database adapter.

The following important directories are also generated:

-   `app/controllers` – This is where the Padrino route definitions should be defined.
-   `app/helpers` – This is where helper methods should be defined for your application.
-   `app/views` – This should contain your template views to be rendered in a controller.
-   `lib` – This should contain any extensions, libraries or other code to be used in your project.
-   `public` – This is where images, style sheets and JavaScript files should be stored.
-   `test` – This is where your model and controller tests should be stored.

Now, let us examine the `config/database.rb` file to make sure the database connection settings are correct. For now, the defaults are OK for this tutorial. A sqlite3 database will be used that is stored inside `db/sample_blog_development.db`.

Let us also setup a few simple routes in our application to demonstrate the Padrino routing system. Let’s go into the `app/app.rb` file and enter the following routes:

    # app/app.rb
    module SampleBlog
      class App < Padrino::Application
        register SassInitializer
        use ActiveRecord::ConnectionAdapters::ConnectionManagement
        register Padrino::Rendering
        register Padrino::Mailer
        register Padrino::Helpers
          
        enable :sessions
          
        # Add these routes below to the app file...
        get "/" do
          "Hello World!"
        end
    
        get :about, :map => '/about_us' do
          render :haml, "%p This is a sample blog created to demonstrate how Padrino works!"
        end
      end
    end

Note that the first route here sets up a simple string to be returned at the root URL of the application. The second route defines a one-line ‘about’ page inline using Haml which is then explicitly mapped to the ‘/about\_us’ URL. The symbol `:about` is used to reference the route later.

Be sure to check out the [controllers guide](/guides/controllers) for a comprehensive overview of the routing system.

 

