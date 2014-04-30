ActiveAdmin.register Quize do |q|
  
  scope :all, :default => true
  scope :publish
  scope :unpublish
  
  permit_params :question, :first_answer, :second_answer, :start_vote, 
    :first_ans_image, :second_ans_image, :is_publish
  
  index do |d|         
    column :id
    column :question   
    column :is_publish
    default_actions             
  end 

  filter :id
  filter :question
  filter :start_vote

  show do |task|
    panel "Quize Details" do
      attributes_table_for task do
        row("ID") { task.id }
        row("QUESTION") { task.question }
        row("FIRST ANSWER") { task.first_answer }
        row("First Image") { image_tag(task.first_aimage, width: '100px') }
        row("SECOND ANSWER") { task.second_answer }
        row("Second Image") { image_tag(task.second_aimage, width: '100px') }
        row("START VOTE") { task.start_vote }
        row("PUBLISH") { status_tag (task.is_publish ? "Done" : "Pending"), (task.is_publish ? :ok : :error) }
      end
    end
  end

 form multipart: true do |f|                        
    f.inputs "Quize Details" do
      f.input :question
      f.input :first_answer
      f.input :second_answer
      f.input :start_vote
      f.input :first_ans_image, :as => :file, :hint => f.template.image_tag(f.object.first_aimage, width: '100px')
      f.input :second_ans_image, :as => :file, :hint => f.template.image_tag(f.object.second_aimage, width: '100px')
      f.input :is_publish, :label => 'Publish'
    end                              
    f.actions                        
  end  
end
