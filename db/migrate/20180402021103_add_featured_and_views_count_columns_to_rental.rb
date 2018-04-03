class AddFeaturedAndViewsCountColumnsToRental < ActiveRecord::Migration[5.1]
  def change
    add_column :rentals, :featured, :boolean, default: false
    add_column :rentals, :views_count, :integer, default: 0

    add_index :rentals, :featured
    add_index :rentals, :views_count
  end
end
