# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_usejquery_session',
  :secret      => 'a8f1ed955541b881143509b28084a1288d56210892d2f0daa866fc10c0c10af7ade22b116b9112f180d81aade7fe4b024377f7f3943544f89b9c68fbd51f3a12'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
