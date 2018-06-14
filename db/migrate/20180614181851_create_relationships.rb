class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.references :follower, null: false, index: :true
      t.references :followed, null: false, index: :true

      t.boolean  :allowed, default: false
      t.boolean  :is_block, default: false

      t.timestamps
    end
  end
end
