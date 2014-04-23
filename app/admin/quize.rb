ActiveAdmin.register Quize do
  
  scope :all, :default => true
  #scope :publish
  #scope :unpublish
  
  permit_params :question, :first_answer, :second_answer, :start_vote, 
    :first_ans_image, :second_ans_image
  
  index do |d|         
    column :id
    column :question
    #column :first_answer
    #column :second_answer
    #column :start_vote
    
    default_actions             
  end 

  filter :id
  filter :question
  filter :start_vote

  form multipart: true do |f|                        
    f.inputs "Quize Details" do
      f.input :question
      f.input :first_answer
      f.input :second_answer
      f.input :start_vote
      f.input :first_ans_image, :as => :file, :hint => f.template.image_tag(f.object.first_ans_image.url(:thumb))
      f.input :second_ans_image, :as => :file, :hint => f.template.image_tag(f.object.second_ans_image.url(:thumb))
    end                              
    f.actions                        
  end  
end
