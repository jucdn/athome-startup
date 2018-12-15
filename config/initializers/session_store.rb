# Be sure to restart your server when you modify this file.

# Myapp::Application.config.session_store :cookie_store, key: '_myapp_session'
Rails.application.config.session_store :active_record_store, :key => '_my_app_session'
