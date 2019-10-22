class CreateUserScoreQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_score_quizzes do |t|
      t.integer :score

      t.timestamps
    end
  end
end
