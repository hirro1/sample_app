# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
###SampleApp::Application.config.secret_key_base = 'cf8237d8bac329e9dca63d3919230b5028d7cd5cb6e95b505f8b2865847f41e4885a88b88f09ee06272a4850bfc835d96673e03a3d8579d6222e9527aaac7f60'
require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
SampleApp::Application.config.secret_key_base = secure_token
