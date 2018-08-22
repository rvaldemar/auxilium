class Api::V1::QuestionsController < Api::V1::BaseController

  before_action :set_question, only: [:show, :update, :destroy]

  # Index action
  def index
    @questions = policy_scope(Question)
  end
  # Index action


  # Show action
  def show
    @user = User.find_by(name: params[:username])
    define_user if @user.nil?
    @badges = gamification(@user)
    user_update(@user, @badges)
  end
  # Show action


  # Create action
  def create
    @question = Question.new(question_params)
    @user = User.find_by(name: params[:question][:username])
    create_user if @user.nil?
    @question.user_id = @user.id
    if @question.save
      render :created, status: :created
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
        render :created
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


  # Search action
  def search
    @user = User.find_by(name: params[:username])
    define_user if @user.nil?
    @questions = Question.search_by_subcategory_and_category(params[:query])
  end
  # Search action


  private


  # Gamification action
  def gamification(user)
    answers = Answer.where(user_id: user.id)
    number_of_answers = answers.length
    number_of_questions = Question.where(user_id: user.id).length
    badges = {}
    voted_answers = []
    answers.each { |answer| voted_answers.push(answer) if answer.votes > 0 }
    number_of_answers > 10 ? badges[:helper] = true : badges[:helper] = false
    number_of_questions > 25 ? badges[:active] = true : badges[:active] = false
    voted_answers.length.to_f / number_of_answers >= 0.75 ? badges[:assertive] = true : badges[:assertive] = false
    badges[:top25] = true
    badges
  end
  # Gamification action


  # User update action
  def user_update(user, badges)
    num_badges = badges.select { |key, value| value}.length
    if user.number_of_badges != num_badges
      user.number_of_badges = num_badges
      user.save
    end
  end
  # User update action


  def question_params
    params.require(:question).permit(:title, :content, :category, :subcategory)
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

  def define_user
    @user = User.new(name: params[:username], email: params[:email], avatar: params[:avatar], password: "123654")
    @user.save
    @user
  end

end
