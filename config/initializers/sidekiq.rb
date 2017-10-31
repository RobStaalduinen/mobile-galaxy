Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'MobileGalaxy', url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'MobileGalaxy', url: ENV['REDIS_URL'] }
end

Sidekiq::Web.app_url = '/'
