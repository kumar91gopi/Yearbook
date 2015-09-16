class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :school
  validates :name, presence: true
  validates :user_type, presence: true, :on => :update
  validates :school_id, presence: true, :on => :update
  validates :gender, presence: true, :on => :update
  
  
  enum user_type: [:student, :teacher, :principal, :other]
  
end
