class Api::V1::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    users =
      case params[:type]
      when "followees"
        current_user.followees
      when "followers"
        current_user.followers
      when "pending_followees"
        current_user.pending_followees
      when "pending_followers"
        current_user.pending_followers
      else
        current_user.followees
      end

    render json: users, status: :ok
  end

  def create
    relationship = current_user.follow(permitted_params[:followed_id])

    case relationship.valid?
    when true
      render json: relationship, status: :ok
    when false
      render json: relationship.errors, status: :unprocessable_entity
    end
  end

  def update
    relationship = current_user.passive_relationships.find_by(follower_id: params[:id])
    relationship.allowed = params[:allowed]

    case relationship.save
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
