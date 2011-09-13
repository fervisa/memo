class CreateAmistads < ActiveRecord::Migration
  def change
    create_table :amistads do |t|
      t.references :amigo
      t.references :amigo_destino

      t.timestamps
    end
    add_index :amistads, :amigo_id
    add_index :amistads, :amigo_destino_id
  end
end
