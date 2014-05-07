class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :quize_id
      t.integer :votes
      
      t.timestamps
    end
  end
end
