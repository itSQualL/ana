class Api::V1::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    relationship = current_user.follow(permitted_params[:followed_id])

    response =
      case relationship.valid?
      when true
        relationship
      when false
        relationship.errors
      end

    render json: response, status: :ok
  end

  def destroy
    relationship = current_user.unfollow(params[:user_id])
    render json: relationship, status: :ok
  end

  private

  def permitted_params
    params.permit(:followed_id)
  end
end
