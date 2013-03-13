class AddIpAddressToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :ip_address, :string
  end
end
