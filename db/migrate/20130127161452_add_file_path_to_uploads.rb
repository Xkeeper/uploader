class AddFilePathToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :file_path, :string
  end
end
