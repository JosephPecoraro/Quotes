# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quotes_session',
  :secret      => 'd18caa2ce25de2d0706583b6dedcd21527e22662aa7294ebe3c9dfa1bffd2e1978e60e7b9fdc0ca770db9195caa9f5ac1ad955a29f9856415800593466970c5e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
