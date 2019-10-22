class UserScoreQuiz < ApplicationRecord
  has_one :quiz
  has_one :user
end
