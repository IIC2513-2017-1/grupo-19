class AddPriceCategoryIdToPrices < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :price_category_id, :integer
  end
end
