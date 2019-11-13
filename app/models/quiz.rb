class Quiz < ApplicationRecord
  has_many :questions
  #has_one :user_score_quiz

  has_many :scores, as: :scoreable
  has_many :users, :through => :scoreable
end
