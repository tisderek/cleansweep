 **Note**: This branch (master) contains a skeleton without any app code, perfect for creating a _new_ application or challenge. If you're looking for an example app built with this skeleton, take a look at the [example](/../..//tree/example) branch which includes basic CRUD and RSpec tests.

### Purpose
The Sinatra Skeleton:

1. Provides a foundation for building challenges or creating a new Sinatra application.
2. Demonstrates a reasonable set of practices around building Sinatra applications.
3. Eases the transition to Rails for Dev Bootcamp students

### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```

### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!

Be prepared to give and receive specific, actionable, and kind feedback!
# cleansweep

PROJECT TRACKING FOLDER:
https://docs.google.com/spreadsheets/d/1l8TJIh4WC3vU4ICOsPJmoirolUKRJGDybDT5Uaf2jaw/edit?usp=sharing

Clean Sweep
   Purporse
Getting street sweeping tickets is no fun. In SF, it's a whole thing and I'm done with getting those tix. Clean Sweep helps me and you avoid getting them tickets.
   MVP
When you park, you hit the home screen bookmark to /park. The site will ask for geolocation data, and once retrieved, it will just have one button: "I'm parked here"
Based on the geolocation, I will query a database I've found at sfdata.org, and determine when the next st sweeping is.
User will be taken to /parked where he'll see the location, the next sweeping time, and how many hours/days it is away from now.
User will be taken to /parked where he'll see the location, the next sweeping time, and how many hours/days it is away from now.
A text message is also sent to the user, so he doesn't need to come to my site
The app will take into acct the location and the current time, and once it reaches a certain threshold, the user gets a text.
To tell us that he moved the car he user can come to the site and hit delete, or text back some pre-defined command
