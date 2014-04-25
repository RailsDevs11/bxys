class Quize < ActiveRecord::Base
  has_many :votes
  
  has_attached_file :first_ans_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :first_ans_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  has_attached_file :second_ans_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :second_ans_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  
  scope :publish, -> { where(is_publish: true ) }
  scope :unpublish, -> { where(is_publish: false ) }
  
  after_create :store_vote
    
  def first_answer_image
    self.first_ans_image.present? ? self.first_ans_image.url(:thumb) : "/assets/noimage.png"
  end

  def second_answer_image
    self.second_ans_image.present? ? self.second_ans_image.url(:thumb) : "/assets/noimage.png"
  end
  
  def answer_first
    self.first_answer.present? ? self.first_answer : "None on these"
  end
  
  def answer_second
    self.second_answer.present? ? self.second_answer : "None of these"
  end
  
  def update_votes
    svote = self.votes.first.votes
    svote = svote ? svote+1 : 1
    self.votes.first.update_attributes(votes: svote)
  end

  def total_votes
    self.votes.first.votes unless self.votes.blank?
  end 
  
  private
  def store_vote
    start_vote = self.start_vote.present? ? self.start_vote : 0
    self.votes.create(:votes => start_vote)
  end
    
end
