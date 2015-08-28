class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :brand
      t.string :name
      t.string :style
      t.string :buy

      t.timestamps null: false
    end
  end
end
