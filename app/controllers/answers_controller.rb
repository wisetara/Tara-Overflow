class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(answer_params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      @answer.update(:user_id => current_user.id)
      @question.answers << @answer
      respond_to do |format|
        format.html { redirect_to question_path(@answer.question_id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render 'new' }
      end
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Answer Updated"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to(root_path)
  end

private
  def answer_params
    params.require(:answer ).permit(:question_id, :content, :user_id)
  end

end


