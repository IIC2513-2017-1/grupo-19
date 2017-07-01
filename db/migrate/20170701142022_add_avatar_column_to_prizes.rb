class AddAvatarColumnToPrizes < ActiveRecord::Migration[5.0]
  def up
     add_attachment :prizes, :avatar
   end

   def down
     remove_attachment :prizes, :avatar
   end
end
