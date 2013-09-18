class Enquete < ActiveRecord::Base
	attr_accessible :title, :description, :questions_attributes
	has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  has_many :essay_questions, :dependent => :destroy
  has_many :numeric_questions, :dependent => :destroy
  has_many :date_questions, :dependent => :destroy
  has_many :responses, :dependent => :destroy

  def self.get_all_published_surveys
  	find_all_by_published true
  end

end
