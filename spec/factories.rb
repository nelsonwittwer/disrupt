FactoryGirl.define do
	factory :startup do |s|
		s.sequence(:name)     { |n| "Starupt #{n}"}
		s.sequence(:url)		{|i| "startup#{i}.com"}
		s.description	"startup from heaven"
		s.twitter "@startupzz"
		s.crunchbase "crunchbase.com/companies/startupzz"
	end

	factory :user do
	    sequence(:name) { |n| "User#{n}" }
	    sequence(:email) { |n| "User#{n}@example.com" }
	    password    "foobar"
	    password_confirmation "foobar"
	    role_id 3
	end

	factory :admin, parent: :user do
		role_id	1
	end

	factory :mod, parent: :user do
		role_id	2
	end

end
