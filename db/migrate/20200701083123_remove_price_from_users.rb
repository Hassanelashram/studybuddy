class RemovePriceFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :price, :integer
    add_monetize :users, :price, currency: { present: false }
  end
end
