class CreateBookClubBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :book_club_books do |t|
      t.integer :book_club_id
      t.integer :book_id
      t.string :archived
      t.string :status
      t.string :suggested_by
      t.string :current

      t.timestamps
    end
  end
end
