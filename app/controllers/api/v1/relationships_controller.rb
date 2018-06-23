class Api::V1::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    relationship = current_user.follow(permitted_params[:followed_id])

    case relationship.valid?
    when true
      render json: relationship, status: :ok
    when false
      render json: relationship.errors, status: :unprocessable_entity
    end
  end

  def destroy
    relationship = current_user.unfollow(params[:id])

    case relationship.try(:destroyed?)
    when true
      render json: relationship, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def permitted_params
    params.permit(:followed_id)
  end
end
