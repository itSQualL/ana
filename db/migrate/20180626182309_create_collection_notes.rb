class CreateCollectionNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_notes do |t|
      t.references :user, null: false, index: :true
      t.boolean :shared, default: false

      t.timestamps
    end

    add_column :notes, :collection_note_id, :integer
    add_index :notes, :collection_note_id
    add_index :collection_notes, [:user_id, :shared]
  end
end
