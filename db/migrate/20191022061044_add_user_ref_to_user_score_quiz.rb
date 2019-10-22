class AddUserRefToUserScoreQuiz < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_score_quizzes, :user, foreign_key: true
  end
end
