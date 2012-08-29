if ["production"].include?(Rails.env)
  MIXPANEL_TOKEN = "b20ca3c43736688c4dfbe81adc2b0a0d"
  YourApplication::Application.config.middleware.use "Mixpanel::Tracker::Middleware", MIXPANEL_TOKEN
else
  class DummyMixpanel
    def method_missing(m, *args, &block)
      true
    end
  end
end