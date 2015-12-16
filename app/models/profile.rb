class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :school
  has_many :signatures, dependent: :destroy
  has_many :signs, :class_name => 'Signature', :foreign_key => 'yearbook_id', dependent: :destroy
  

  validates :name, presence: true,  length: { maximum: 50 }
  validates :user_type, presence: true, :on => :update
  validates :school_id, presence: true, :on => :update
  validates :gender, presence: true, :on => :update
  validates :about_me,  length: { maximum: 1000 }
  validates :city,  length: { maximum: 100 }
  validate  :picture_size
  
  enum user_type: [:Student, :Teacher, :Principal, :Other]
  has_many :educations, :dependent => :destroy
  accepts_nested_attributes_for :educations,
                                  :allow_destroy => true,
                                  :reject_if     => proc { |attributes| attributes['institute'].blank? }
  has_many :occupations, :dependent => :destroy
  accepts_nested_attributes_for :occupations,
                                  :allow_destroy => true,
                                  :reject_if     => proc { |attributes| attributes['company'].blank? }
                                  
  
  mount_uploader :profile_pic, ProfilePicUploader
  
  # Validates the size of an uploaded picture.
    def picture_size
      if profile_pic.size > 3.megabytes
        errors.add(:profile_pic, "should be less than 3MB")
      end
    end

    def self.search(query)
          where("name like ?", "%#{query}%") 
    end
  
end
