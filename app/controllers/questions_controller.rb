class QuestionsController < ApplicationController
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @questions = Question.paginate(page: params[:page], per_page: 5).order(votes_count: :desc, updated_at: :desc)
  end

  def show
    @blurbs = @question.blurbs
  end

  def new
    @question = Question.new
  end

  def edit
  end
  

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # This method ensures the "white-listing" of what's being passed into the contoller.
    # We specify what is expected in the params sent from the view
    def question_params
      params.require(:question).permit(:question, topic_ids: [])
    end

  def require_same_user
    if current_user != @question.user
      flash[:danger] = "You can only edit or delete your own article"
      redirect_to root_path
    end
  end
end
