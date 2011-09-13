class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :amistad
      t.string :asunto
      t.text :contenido
      t.date :fecha
      t.time :hora

      t.timestamps
    end
    add_index :emails, :amistad_id
  end
end
