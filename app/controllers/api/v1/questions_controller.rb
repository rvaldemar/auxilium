class Api::V1::QuestionsController < Api::V1::BaseController

  before_action :set_question, only: [:show, :update, :destroy]

  # Index action
  def index
    @questions = policy_scope(Question)
  end
  # Index action


  # Show action
  def show
  end
  # Show action


  # Create action
  def create
    @question = Question.new(question_params)
    @user = User.find_by(name: params[:question][:username])
    create_user if @user.nil?
    @question.user_id = @user.id
    if @question.save
      render :show, status: :created
    else
      render_error
    end
  end
  # Create action


  # Update action
  def update
    @user = User.find_by(name: params[:question][:username])
    if @question.user_id == @user.id
      if @question.update(question_params)
        render :show
      else
        render_error
      end
    end
  end
  # Update action


  # Destroy action
  def destroy
    @user = User.find_by(name: params[:question][:username])
    if @question.user_id == @user.id
      @question.destroy
    # else
    #   render_error
    end
  end
  # Destroy action


  private

  def question_params
    params.require(:question).permit(:title, :content, :category)
  end

  def user_params
    params.permit(:email, :name, :username, :avatar)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def render_error
    render json: { errors: @question.errors.full_messages },
      status: :unprocessable_entity
  end

  def create_user
    @user = User.new(name: params[:question][:username], email: params[:question][:email], avatar: params[:question][:avatar], password: "123654")
    @user.save
    @user
  end
end
