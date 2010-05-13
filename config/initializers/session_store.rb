# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_con_session',
  :secret      => '2c55bc56019dad1c1ecb49d5656de96be32ce9a95300c5b3150b5febd499a4c03298167e440f30bafd7b69d7931700ec004c3fe79ac52267927b2432053df221'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
