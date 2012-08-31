# if Rails.env.production?
#   MIXPANEL_TOKEN = "b20ca3c43736688c4dfbe81adc2b0a0d"
#   Disrupt::Application.config.middleware.use "Mixpanel::Tracker::Middleware", MIXPANEL_TOKEN
# elsif Rails.env.development?
#   MIXPANEL_TOKEN = "76f7e5f526f1b508652dc7e397c80f6f"
#   Disrupt::Application.config.middleware.use "Mixpanel::Tracker::Middleware", MIXPANEL_TOKEN
# else 
	
#   class DummyMixpanel
#     def method_missing(m, *args, &block)
#       true
#     end
#   end
# end