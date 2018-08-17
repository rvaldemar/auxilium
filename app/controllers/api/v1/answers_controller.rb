class Api::V1::AnswersController < Api::V1::BaseController

  before_action :set_answer, only: [:update, :destroy]

  # Create action
  def create
    @answer = Answer.new(answer_params)
    user = User.find_by(name: params[:answer][:username])
    @answer.user_id = user.id
    @answer.votes = 0
    @answer.question_id = params[:question_id]
    if @answer.save
      render :show, status: :created
    else
      render :error
    end
  end
  # Create action


  # Update action
  def update
    user = User.find_by(name: params[:answer][:username])
    if @answer.user_id == user.id
      if @answer.update(answer_params)
        render :show
      else
        render :error
      end
    end
  end
  # Update action


  # Destroy action
  def destroy
    user = User.find_by(name: params[:answer][:username])
    if @answer.user_id == user.id
      @answer.destroy
    # else
    #   redirect_to api_v1_questions_path
    end
  end
  # Destroy action


  private


  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
