class UserScoreQuizController < ApplicationController
  def new
    @user_score_quiz = UserScoreQuiz.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_score_quiz
      @user_score_quiz = UserScoreQuiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_score_quiz_params
      params.require(:user_score_quiz).permit(:score, :user, :quiz)
    end
end
