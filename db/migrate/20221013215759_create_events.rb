class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :date
      t.string :time
      t.string :description
      t.integer :host_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode


      t.timestamps
    end
  end
end