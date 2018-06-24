class Api::V1::NotesController < ApplicationController
  before_action :authenticate_user!

  def index
    notes =
      case params[:type]
      when "followees_notes"
        current_user.followees_notes
      else
        current_user.notes
      end

    render json: notes, status: :ok
  end

  def create
    note = current_user.notes.create(note_params)

    case note.valid?
    when true
      render json: note, status: :ok
    when false
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def update
    note = current_user.notes.find(params[:id])

    case note.update_attributes(note_params)
    when true
      render json: note, status: :ok
    when false
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    note = current_user.notes.find_by(id: params[:id]).try(:destroy)

    case note.try(:destroyed?)
    when true
      render json: note, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def note_params
    params.require(:note).permit(:body, :shared, images: [])
  end
end
