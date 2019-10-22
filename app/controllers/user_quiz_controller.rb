class UserQuizController < ApplicationController
  before_action :set_user_quiz

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_quiz
      @user_quiz = UserQuiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_quiz_params
      params.require(:user_quiz).permit(:score)
    end
end
