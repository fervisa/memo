class CreateSkins < ActiveRecord::Migration
  def change
    create_table :skins do |t|
      t.string :margen

      t.timestamps
    end
  end
end
