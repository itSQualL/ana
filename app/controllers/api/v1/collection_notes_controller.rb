class Api::V1::CollectionNotesController < ApplicationController
  before_action :authenticate_user!

  def index
    collection_notes =
      case params[:type]
      when "followees_notes"
        current_user.followees_collection_notes
      else
        current_user.collection_notes
      end

    render json: collection_notes, status: :ok
  end

  def create
    collection_note = current_user.collection_notes.create(collection_note_params)

    case collection_note.valid?
    when true
      render json: collection_note, status: :ok
    when false
      render json: collection_note.errors, status: :unprocessable_entity
    end
  end

  def update
    collection_note = current_user.collection_notes.find(params[:id])

    case collection_note.update_attributes(collection_note_params)
    when true
      render json: collection_note, status: :ok
    when false
      render json: collection_note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    collection_note = current_user.collection_notes.find_by(id: params[:id]).try(:destroy)

    case collection_note.try(:destroyed?)
    when true
      render json: collection_note, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def collection_note_params
    params.require(:collection_note).permit(:shared, notes_attributes: [:body, :shared, images: []])
  end
end
