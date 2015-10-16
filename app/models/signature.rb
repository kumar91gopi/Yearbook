class Signature < ActiveRecord::Base
  belongs_to :profile
  belongs_to :yearbook, :class_name => 'Profile', :foreign_key => 'yearbook_id'
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  
  validates :profile_id, presence: true
  validates :yearbook_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validate  :image_size

  private

    # Validates the size of an uploaded picture.
    def image_size
      if image.size > 3.megabytes
        errors.add(:picture, "should be less than 3MB")
      end
    end

end
