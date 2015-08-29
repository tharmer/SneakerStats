class AddSneakerIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :sneaker_id, :integer
  end
end
