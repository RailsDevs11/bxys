class Quize < ActiveRecord::Base
  
  #do_not_validate_attachment_file_type :first_ans_image, :second_ans_image
  
  has_attached_file :first_ans_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :first_ans_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  has_attached_file :second_ans_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :second_ans_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

end
