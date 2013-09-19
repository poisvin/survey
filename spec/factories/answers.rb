FactoryGirl.define do
  factory :answer do
    response
    question
    content "trial"
  end

  factory :empty_content, parent: :answer do
  	content nil
  end
	
	factory :empty_question, parent: :answer do
  	question nil
  end

  factory :number, parent: :answer do 
    content 007
  end

  factory :date, parent: :answer do 
    content Time.now.strftime("%Y/%m/%d")
  end
end