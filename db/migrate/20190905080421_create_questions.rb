class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :itemno
      t.string :quest_txt
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.string :answer
      t.integer :quiz_id

      t.timestamps
    end
  end
end
