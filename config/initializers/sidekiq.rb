require 'sidekiq'
require 'sidekiq-status'
require 'sidekiq-status/web'

require 'sidekiq/web'
Sidekiq::Web.set :sessions, false

Sidekiq::Extensions.enable_delay!
