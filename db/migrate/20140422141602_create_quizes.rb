class CreateQuizes < ActiveRecord::Migration
  def change
    create_table :quizes do |t|
      t.string :question
      t.string :first_answer
      t.string :second_answer
      t.integer :start_vote
      t.attachment :first_ans_image
      t.attachment :second_ans_image
      
      t.timestamps
    end
  end
end
