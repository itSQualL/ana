class Api::V1::Admin::UsersController < AdminBaseController
  def index
    users = User.all
    render json: users, status: :ok
  end

  def create
    user = User.create(user_params)

    case user.valid?
    when true
      render json: user, status: :ok
    when false
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])

    case user.update_attributes(user_params)
    when true
      render json: user, status: :ok
    when false
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id]).try(:destroy)

    case user.try(:destroyed?)
    when true
      render json: user, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :admin)
  end
end
