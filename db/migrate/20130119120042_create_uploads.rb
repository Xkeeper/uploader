class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename, :null => false
      t.datetime :upload_date, :null => false
      t.integer :filesize

      t.timestamps
    end
  end
end
