class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :enquete

  attr_accessible :enquete_id, :user_id, :answers_attributes

  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  validates :enquete, presence: true
  validates :user, presence: true
end
