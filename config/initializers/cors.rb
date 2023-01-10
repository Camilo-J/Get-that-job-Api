# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.use Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: :any,
             expose: %w[expiry token-type Authorization],
             methods: %i[get post options delete put patch]
  end
end
