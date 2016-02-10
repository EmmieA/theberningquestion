class BlurbsController < ApplicationController

  before_action :set_blurb, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @blurbs = Blurb.all
  end

  def show
    @comments = @blurb.comments
  end

  def new
    @blurb = Blurb.new
    @question = Question.find(params[:question_id])
  end
  
  def edit
    
  end

  def create
    @blurb = Blurb.new(blurb_params)
    @blurb.user = current_user
    @blurb.question_id = params[:question_id]
    @question = Question.find(params[:question_id])
  
    respond_to do |format|
      if @blurb.save
        format.html { redirect_to @question, notice: 'Discussion started!' }
      else
        format.html { render :new }
      end
    end
  end
  
  def destroy
    @blurb.destroy
    respond_to do |format|
      format.html { redirect_to blurbs_url, notice: 'Discussion removed' }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blurb
      @blur = Blurb.find(params[:id])
    end

    def blurb_params
      params.require(:blurb).permit(:blurb, :question_id)
    end

  def require_same_user
    if current_user != @blurb.user
      flash[:danger] = "You can only edit or delete your own discussion"
      redirect_to root_path
    end
  end
  
end
