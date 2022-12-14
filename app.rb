require "sqlite3"
require 'pry'
# Instantiate a constant variable, DB, usable in all your files
dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir, "db/posts.db"))

# Require all the ruby files you have created in `app`
Dir[File.join(dir, "app/**/*.rb")].sort.each { |file| require file }

# Launch the app!
Router.new.run
