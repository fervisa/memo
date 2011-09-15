class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.references :amigo
      t.string :nombre

      t.timestamps
    end
    add_index :avatars, :amigo_id
  end
end
