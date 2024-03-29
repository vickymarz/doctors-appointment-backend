
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ["https://doctors-appointment-app-2k1t.onrender.com", "http://doctors-appointment-app-2k1t.onrender.com", "http://localhost:3000", "http://localhost:3001"]
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ["Authorization", "access-token", "expiry", "client", "uid", "token-type"],
      max_age: 600
  end
end
