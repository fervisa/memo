class CreateHistorials < ActiveRecord::Migration
  def change
    create_table :historials do |t|
      t.references :amigo

      t.timestamps
    end
    add_index :historials, :amigo_id
  end
end
