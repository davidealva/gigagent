class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.string :venue
      t.string :city
      t.string :state
      t.string :country
      t.string :event_url
      t.boolean :confirmed
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
