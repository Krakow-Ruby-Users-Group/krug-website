class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :meetup_id
      t.string :name
      t.integer :rsvp_limit
      t.integer :status, default: 0
      t.datetime :time
      t.datetime :created
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
