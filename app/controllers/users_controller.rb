class UsersController < ApplicationController

  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
end
def show
    @user = User.find(params[:id])
   if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else 
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  def update
    user = User.find_by(id: params[:id])
    # byebug

      if params[:colorAnswers]
        colorAnswer = user_color_params.values.each_with_object(Hash.new(0)){ |v, counts| counts[v] += 1 }.sort_by{|k, v| v}.last.first
        set_user_color(user, colorAnswer)
      elsif params[:userInfo]
        user.update(user_detail_params)
        user.zodiac_setter
        user.save!
      end
    # user.save!
    # byebug
    render json: user
  end

  def upload_image
    # byebug
    user = User.find_by(id: params[:id])
    img = Cloudinary::Uploader.upload(params[:file])
    user_img = img["url"]
    user.image = user_img
    user.save!

    render json: user
  end

private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_color_params
    params.require(:colorAnswers).permit(:question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11)
  end

  def user_detail_params
    params.require(:userInfo).permit(:birthday, :gender, :location, :bio, :status)
    # params.require(:userInfo).permit(:birthday, :gender, :location)
  end

  def set_user_color(user, color_answer)
    
    case color_answer
    when "a"
      user.color = "orange"
    when "b"
      user.color = "green"
    when "c"
      user.color = "blue"
    when "d"
      user.color = "gold"
    end

    user.save!
  end


end