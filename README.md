Statushub: A product by hackers at Idfy for hackers.

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
* heroku open

Caveats: Search & image feature won't work on Heroku as Heroku's filesystem is readonly and solr search add on is paid on heroku https://elements.heroku.com/addons/websolr

Documentation & Notes: Run `rake notes` to get a list of notes.
