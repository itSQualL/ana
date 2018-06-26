class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user, index: :true

      t.text :body
      t.boolean :shared, default: false

      t.timestamps
    end

    add_index :notes, [:user_id, :shared]
  end
end
