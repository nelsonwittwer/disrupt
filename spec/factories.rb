FactoryGirl.define do
	factory :startup do |s|
		s.sequence(:name)     { |n| "Starupt #{n}"}
		s.sequence(:url)		{|i| "startup#{i}.com"}
		s.description	"startup from heaven"
		s.twitter "@startupzz"
		s.crunchbase "crunchbase.com/companies/startupzz"
	end

	factory :user do
	    sequence(:name) { |n| "Test User#{n}" }
	    sequence(:email) { |n| "test-user#{n}@example.com" }
	    password    "foobar"
	    password_confirmation "foobar"
	end

end
