class AddCategoryRefToBooks < ActiveRecord::Migration
  def change
    add_column :books, :category_id, :reference
  end
end
