class Api::V1::Admin::NotesController < AdminBaseController
  def index
    notes = Note.all
    render json: notes, status: :ok
  end

  def create
    note = Note.create(note_params)

    case note.valid?
    when true
      render json: note, status: :ok
    when false
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def update
    note = Note.find(params[:id])

    case note.update_attributes(note_params)
    when true
      render json: note, status: :ok
    when false
      render json: note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    note = Note.find_by(id: params[:id]).try(:destroy)

    case note.try(:destroyed?)
    when true
      render json: note, status: :ok
    when false || nil
      render status: :not_found
    end
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :body, :shared, images: [])
  end
end
