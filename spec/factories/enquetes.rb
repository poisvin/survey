# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enquete do
  	# user
	sequence(:title) { |n| "name_#{n}" } 	
  end
end
