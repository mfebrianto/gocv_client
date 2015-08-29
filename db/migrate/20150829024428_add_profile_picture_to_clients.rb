class AddProfilePictureToClients < ActiveRecord::Migration
  def up
    add_attachment :clients, :profile_picture
  end

  def down
    remove_attachment :clients, :profile_picture
  end
end
