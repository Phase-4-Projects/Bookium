class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :book_club_book_id
      t.string :chapter
      t.string :question
      t.timestamps
    end
  end
end
