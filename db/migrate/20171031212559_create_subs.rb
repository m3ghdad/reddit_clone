class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :, null: false
      t.integer :modetator_id, null: false

      t.timestamps
    end
    add_index :subs, :modetator_id
  end
end
