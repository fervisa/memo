class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.references :conf_usuario
      t.string :nombre

      t.timestamps
    end
    add_index :avatars, :conf_usuario_id
  end
end
