Statushub: This was my submission for IDFY's [HackerEarth challenge](https://www.hackerearth.com/idfy-full-stack-developer-hiring-challenge/). Please bear in mind that the app was supposed to be completed in 12 hours, as a result some of the best practices were avoided in order to get the things done on time. Checkout the [demo here](https://immense-cove-8413.herokuapp.com/)

Installation instructions:

* cd statushub && bundle
* rake db:migrate
* bundle exec rake sunspot:solr:start
* rake db:seed
* rails s

Stack:

* Ruby on Rails: Web application fram
* Sqlite3 for development: It doesn't require any setup.
* Postgresql(for heroku): Production database. Usually I keep same database across all environments, but in this case I'm using different db's to make installation easier.
* pgSearch: For search.

Deployment on Heorku:

* cd statushub
* heroku create
* git push heroku master
* heroku run rake db:migrate
* heroku run rake heroku:seed
* heroku open

Screenshots:
All of the screenshots are in screenshots directory.

Home page: Just like the one shown in the wireframe
![root page](https://www.dropbox.com/s/kapm5e064yk4phi/Screenshot%202015-11-22%2020.40.32.png?dl=0)

Pagination:
![pagination on index page](https://www.dropbox.com/s/syhobazxa0gt8dx/Screenshot%202015-11-22%2020.43.03.png?dl=0)

Favorites page:
![favorites page](https://www.dropbox.com/s/vmk1gbvevo4k81c/Screenshot%202015-11-22%2020.44.05.png?dl=0)

Notes:

1. Avoid different database in different environment(One of the rule from 'The Twelve Factors'). Breaking this rule for reviewer's convenience.
2. Generally use git flow.
3. Generally use .rvmrc or .ruby_version for setting ruby version & gemset. Not using here for convenience.

Documentation & Notes: Run `rake notes` to get a list of notes.
