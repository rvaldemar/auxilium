class Api::V1::CommentsController < Api::V1::BaseController

  before_action :set_comment, only: [:update, :destroy]

  # Create action
  def create
    @comment = Comment.new(comment_params)
    @user = User.find_by(name: params[:comment][:username])
    create_user if @user.nil?
    @comment.user_id = @user.id
    @comment.votes = 0
    @comment.answer_id = params[:answer_id]
    if @comment.save
      render :show, status: :created
    else
      render :error
    end
  end
  # Create action


  # Update action
  def update
    @user = User.find_by(name: params[:comment][:username])
    if @comment.user_id == @user.id
      if @comment.update(comment_params)
        render :show
      else
        render :error
      end
    end
  end
  # Update action


  # Destroy action
  def destroy
    @user = User.find_by(name: params[:comment][:username])
    if @comment.user_id == @user.id
      @comment.destroy
      head :no_content and return
    end
    head :no_content and return
    # else
    #   redirect_to api_v1_questions_path
    # end
  end
  # Destroy action


  private


  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

    def create_user
    @user = User.new(name: params[:comment][:username], email: params[:comment][:email], avatar: params[:comment][:avatar], password: "123654")
    @user.save
    @user
  end
end
