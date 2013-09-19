FactoryGirl.define do
  factory :question do
    enquete
    content "trial"
    type 'EssayQuestion'
  end

  factory :numeric_question, parent: :question do 
    type 'NumericQuestion'
  end

  factory :date_question, parent: :question do 
    type 'DateQuestion'
  end

end
