class CreateBooklubs < ActiveRecord::Migration[6.1]
  def change
    create_table :booklubs do |t|

      t.timestamps
    end
  end
end
