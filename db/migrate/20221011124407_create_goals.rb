class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.integer :book_club_book_id
      t.string :meeting_url
      t.string :notes
      t.string :complete
      t.string :priority
      t.string :pages
      t.datetime :deadline

      t.timestamps
    end
  end
end
