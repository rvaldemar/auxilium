class Api::V1::AnswersController < Api::V1::BaseController

  before_action :set_answer, only: [:update, :destroy]

  # Create action
  def create
    @answer = Answer.new(answer_params)
    @user = User.find_by(name: params[:answer][:username])
    create_user if @user.nil?
    @answer.user_id = @user.id
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
    @user = User.find_by(name: params[:answer][:username])
    if @answer.user_id == @user.id
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
    @user = User.find_by(name: params[:answer][:username])
    if @answer.user_id == @user.id
      @answer.destroy
    end
  end
  # Destroy action


  def upvote
    @answer = Answer.find(params[:answer_id])
    @user = User.find_by(name: params[:answer][:username])
    if @answer.answer_votes.where(user_id: @user.id).length == 0
      @answer.votes += 1
      answer_vote = AnswerVote.create(user_id: @user.id, answer_id: @answer.id)
      @answer.save
      render :show and return
    end
    render :show
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    @user = User.find_by(name: params[:answer][:username])
    if @answer.answer_votes.where(user_id: @user.id).length == 0
      @answer.votes -= 1
      answer_vote = AnswerVote.create(user_id: @user.id, answer_id: @answer.id)
      @answer.save
      render :show and return
    end
    render :show
  end


  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def create_user
    @user = User.new(name: params[:answer][:username], email: params[:answer][:email], avatar: params[:answer][:avatar], password: "123654")
    @user.save
    @user
  end
end
