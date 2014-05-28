# Connect to the DB
ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => "db.sqlite3"
)

# Recreate the database
ActiveRecord::Migration.suppress_messages do
    require './schema.rb'
end

I18n.enforce_available_locales = false
