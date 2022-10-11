class CreateBookClubUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :book_club_users do |t|
      t.integer :user_id
      t.integer :book_club_id
      t.string :isAdmin
      t.timestamps
    end
  end
end
