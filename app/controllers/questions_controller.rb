class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    if current_user
      @questions = Question.all
    else
      redirect_to home_path
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show

  end



  # GET /questions/new
  def new
    @question = Question.new

  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update

    if params.has_key?(:question)
      @question.update_attributes(params[:question].permit(:role_ids))
    end
    respond_to do |format|

      if @question.update(question_params)

        if @question.answer == @question.guess

         #@question.quiz.scores.first.quiz_score = @question.quiz.scores.first.quiz_score + 1
         #@question.quiz.scores.last.increment(:quiz_score, by = 1)
         #@question.quiz.scores.first.update_attribute(:quiz_score, @question.quiz.scores.first.quiz_score += 1)
         @question.quiz.scores.last.update_attribute(:quiz_score, @question.quiz.scores.last.quiz_score += 1)
         @question.quiz.scores.last.save
          format.html { redirect_to @question, notice: 'Answer is correct. Current score: ' + @question.quiz.scores.last.quiz_score.to_s + ' of ' + current_user.email.split('@')[0].to_s}
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { redirect_to @question, notice: 'Answer is incorrect. Correct choice is ' + @question.answer.to_s + ' ' + current_user.email.split('@')[0].to_s}
          format.json { render :show, status: :ok, location: @question }
        end
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:itemno, :quest_txt, :choice1, :choice2, :choice3, :choice4, :answer, :quiz_id, :guess)
    end
end
