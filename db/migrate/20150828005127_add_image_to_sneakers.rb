class AddImageToSneakers < ActiveRecord::Migration
  def change
    add_column :sneakers, :image, :string
  end
end
