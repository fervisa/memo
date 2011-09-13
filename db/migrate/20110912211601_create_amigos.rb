class CreateAmigos< ActiveRecord::Migration
  def change
    create_table :amigos do |t|
      t.references :skin
      t.references :usuario
      t.boolean :activo
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
    add_index :amigos, :skin_id
    add_index :amigos, :usuario_id
  end
end
