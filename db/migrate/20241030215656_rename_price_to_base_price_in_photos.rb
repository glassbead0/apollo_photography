class RenamePriceToBasePriceInPhotos < ActiveRecord::Migration[7.1]
  def change
    rename_column :photos, :price, :base_price
  end
end
