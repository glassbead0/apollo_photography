class AddActiveAndPositionToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :photos, :active, :boolean, default: true
    add_column :photos, :position, :integer
  end
end
