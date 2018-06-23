class Api::V1::BlocksController < ApplicationController
  before_action :authenticate_user!

  def create
    block = current_user.block(permitted_params[:blocked_id])

    case block.valid?
    when true
      render json: block, status: :ok
    when false
      render json: block.errors, status: :unprocessable_entity
    end
  end

  def destroy
    block = current_user.unblock(params[:id])

    case block.try(:destroyed?)
    when true
      render json: block, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def permitted_params
    params.permit(:blocked_id)
  end
end
