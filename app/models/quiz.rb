class Quiz < ApplicationRecord
  has_many :questions
  has_one :user_quiz
  has_one :user, :through => :user_quiz
end
