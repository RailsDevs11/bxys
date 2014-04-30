class Quize < ActiveRecord::Base
  
  #do_not_validate_attachment_file_type :first_ans_image, :second_ans_image
  
  has_attached_file :first_ans_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :first_ans_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  has_attached_file :second_ans_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :second_ans_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  
  scope :publish, -> { where(is_publish: true ) }
  scope :unpublish, -> { where(is_publish: false ) }
  
  def first_aimage
    self.first_ans_image && self.first_ans_image.present? ? self.first_ans_image.url(:thumb) : "/assets/noimage.jpg"
  end

  def second_aimage
    self.second_ans_image && self.second_ans_image.present? ? self.second_ans_image.url(:thumb) : "/assets/noimage.jpg"
  end

end
