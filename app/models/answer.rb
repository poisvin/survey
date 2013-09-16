class Answer < ActiveRecord::Base
  attr_accessible :user_id, :content, :question_id

  belongs_to :question
  belongs_to :response, :inverse_of => :answers

  validates_presence_of :content
  validates_presence_of :question
  validates_numericality_of :content, :if => :numeric_question?
  validate :date_should_be_valid

  private
  	def numeric_question?
  		question.type == 'NumericQuestion' if question
  	end

  	def date_should_be_valid
  	  if question && question.type == "DateQuestion"
  	    unless content =~ /\A\d{4}\/(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\Z/
  	      errors.add(:content, '- Invalid date format')
  	    end
  	  end
  	end

end
