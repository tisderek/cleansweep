# ActiveRecord TODOs

## Before You Get Started

Before you get started...

1.  **Install Correct Version of SQLite3**

    Run the following from the command line:

    ```text
    which sqlite3
    ```

    This should either print out `/usr/bin/sqlite3` or `/usr/local/bin/sqlite3`.  We want it to print out `/usr/local/bin/sqlite3`.  If it prints out `/usr/bin/sqlite3` run the following from the command line:

    ```text
    brew link sqlite3
    ```

    Now run `which sqlite3` again and make sure it says `/usr/local/bin/sqlite3`.  If it still doesn't find a staff member to help!

2.  **Run `bundle` from the application root directory**

    From your application root directory, run the following command to install any necessary gems:

    ```text
    $ bundle
    ```

    This will install all the gems listed in the `Gemfile`.

## Getting Started

You're now ready to rock.  Run

```text
$ rake -T
```

to see the rake tasks available to you.  Run `rake db:create` to create the (empty) database file.  Run `rake db:migrate` to run migrations that have yet to be applied.

Create a file in the application root directory, e.g., `todo.rb`, to act as your main program.

<table class="table table-striped table-bordered">
  <tr>
    <th>File or Directory</th>
    <th>Purpose</th>
  </tr>

  <tr>
    <td><code>app/models/</code></td>
    <td>Location of your ActiveRecord models; filenames should be singular and `snake_case`.  These are autoloaded.</td>
  </tr>

  <tr>
    <td><code>app/controllers/</code></td>
    <td>Location of any controller code; this isn't auto-loaded, so you'll have to manually include your controllers</td>
  </tr>

  <tr>
    <td><code>db/seeds.rb</code</td>
    <td>Place any database seed code in this file.  You automatically have access to your ActiveRecord models.  Run using `rake db:seed`.</td>
  </tr>
  <tr>
    <td><code>spec/</code></td>
    <td>Location of your specs, using [RSpec](http://rspec.info/).  Run with `rake spec`.</td>
  </tr>
  <tr>
    <td><code>config/application.rb</code></td>
    <td>Your main application file; **do not** add user-facing code to this file.  Your application should include this file.</td>
  </tr>
</table>

