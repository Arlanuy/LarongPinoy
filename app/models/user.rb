class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions
  has_many :scores, as: :scoreable

  #has_one :user_score_quiz
  #has_many :quizzes, :through => :user_score_quiz
end
