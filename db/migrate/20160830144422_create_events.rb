class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :rsvp_limit
      t.integer :status, default: 0
      t.time :time
      t.time :created
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
