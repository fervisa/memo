class CreateHistorials < ActiveRecord::Migration
  def change
    create_table :historials do |t|
      t.references :amistad
      t.date :fecha
      t.time :hora

      t.timestamps
    end
    add_index :historials, :amistad_id
  end
end
