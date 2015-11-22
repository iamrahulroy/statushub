Statushub: A product by hackers at Idfy for hackers. Checkout the [demo here](https://immense-cove-8413.herokuapp.com/)

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
* Solr: For search

Deployment on Heorku:

* cd statushub
* heroku create
* git push heroku master
* heroku run rake db:migrate
* heroku run rake heroku:seed
* heroku open

Caveats: Search & image feature won't work on Heroku as Heroku's filesystem is readonly and solr search add on is paid on heroku https://elements.heroku.com/addons/websolr

Screenshots:

Home page: Just like the one shown in the wireframe
![root page](https://www.dropbox.com/s/ejy5d8np7cvqkhp/Screenshot%202015-11-22%2019.14.28.png?dl=0)

Pagination:
![pagination on index page](https://www.dropbox.com/s/4kwvz2ikjlyx0nx/Screenshot%202015-11-22%2019.18.16.png?dl=0)

Favorites page:
![favorites page](https://www.dropbox.com/s/059i84h1688mjqt/Screenshot%202015-11-22%2019.21.57.png?dl=0)

Notes:

1. Avoid different database in different environment(One of the rule from 'The Twelve Factors'). Breaking this rule for reviewer's convenience.
2. Generally use git flow.
3. Generally use .rvmrc or .ruby_version for setting ruby version & gemset. Not using here for convenience.

Documentation & Notes: Run `rake notes` to get a list of notes.
