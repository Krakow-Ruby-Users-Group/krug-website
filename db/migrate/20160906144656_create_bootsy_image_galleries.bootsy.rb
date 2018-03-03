# This migration comes from bootsy (originally 20120628124845)
class CreateBootsyImageGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :bootsy_image_galleries do |t|
      t.references :bootsy_resource, polymorphic: true, index: { name: 'bootsy_image_galleries_index' }
      t.timestamps
    end
  end
end
