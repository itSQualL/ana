class Api::V1::Admin::RelationshipsController < AdminBaseController
  def index
    relationships = Relationship.all
    render json: relationships, status: :ok
  end

  def create
    relationship = Relationship.create(relationship_params)

    case relationship.valid?
    when true
      render json: relationship, status: :ok
    when false
      render json: relationship.errors, status: :unprocessable_entity
    end
  end

  def update
    relationship = Relationship.find(params[:id])

    case relationship.update_attributes(relationship_params)
    when true
      render json: relationship, status: :ok
    when false
      render json: relationship.errors, status: :unprocessable_entity
    end
  end

  def destroy
    relationship = Relationship.find_by(id: params[:id]).try(:destroy)

    case relationship.try(:destroyed?)
    when true
      render json: relationship, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id, :allowed)
  end
end
