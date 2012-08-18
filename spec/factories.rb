
Factory.define :startup do |s|
s.sequence(:name)     { |n| "Starupt #{n}"}
s.sequence(:url)		{|i| "startup#{i}.com"}
s.description	"startup from heaven"
s.twitter "@startupzz"
s.crunchbase "crunchbase.com/companies/startupzz"
end
