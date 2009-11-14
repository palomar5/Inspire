# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_inspire_session',
  :secret      => 'e24e57478846332cc9c510acdcb22bde292f6aa2fe393a83ec94a121a23ece6966999c62399d1e4e354c01d62a7a49477a6f93bd4952b44dff313c3045e17ac0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
