class AddAttachmentPlaticaToHistorial < ActiveRecord::Migration
  def self.up
    add_column :historials, :platica_file_name, :string
    add_column :historials, :platica_content_type, :string
    add_column :historials, :platica_file_size, :integer
    add_column :historials, :platica_updated_at, :datetime
  end

  def self.down
    remove_column :historials, :platica_file_name
    remove_column :historials, :platica_content_type
    remove_column :historials, :platica_file_size
    remove_column :historials, :platica_updated_at
  end
end
