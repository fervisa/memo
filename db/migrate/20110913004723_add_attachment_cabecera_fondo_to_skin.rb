class AddAttachmentCabeceraFondoToSkin < ActiveRecord::Migration
  def self.up
    add_column :skins, :cabecera_file_name, :string
    add_column :skins, :cabecera_content_type, :string
    add_column :skins, :cabecera_file_size, :integer
    add_column :skins, :cabecera_updated_at, :datetime
    add_column :skins, :fondo_file_name, :string
    add_column :skins, :fondo_content_type, :string
    add_column :skins, :fondo_file_size, :integer
    add_column :skins, :fondo_updated_at, :datetime
  end

  def self.down
    remove_column :skins, :cabecera_file_name
    remove_column :skins, :cabecera_content_type
    remove_column :skins, :cabecera_file_size
    remove_column :skins, :cabecera_updated_at
    remove_column :skins, :fondo_file_name
    remove_column :skins, :fondo_content_type
    remove_column :skins, :fondo_file_size
    remove_column :skins, :fondo_updated_at
  end
end
