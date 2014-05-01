class QuestionsController < ApplicationController

before_filter :authorize, only: [:edit, :update]

  def index
    @questions = Question.all
  end

  def new
    @user = current_user
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @question.update(:user_id => current_user.id)
      redirect_to question_path(@question)
    else
      flash[:alert] = "New question not created."
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @answer = Answer.new
    # @answers = Answer.all.order(top_vote: :desc)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question - Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question #{@question.title} did not update. Try again!"
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:alert] = "#{question.title} deleted!"
    redirect_to root_url
  end


private
  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end
end
