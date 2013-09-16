class Question < ActiveRecord::Base
	attr_accessible :content, :enquete_id, :type, :question_type
	validates_presence_of :content
	has_many :answers
	belongs_to :enquete
	has_many :answers, :dependent => :destroy
  # attr_accessible :title, :body


  def self.types
  	[['Date Question', 'DateQuestion'], ['Numeric Question', 'NumericQuestion'], ['Essay Question', 'EssayQuestion']]
  end
end
