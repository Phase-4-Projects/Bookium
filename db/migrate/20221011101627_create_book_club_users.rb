class CreateBookClubUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :book_club_users do |t|

      t.timestamps
    end
  end
end
