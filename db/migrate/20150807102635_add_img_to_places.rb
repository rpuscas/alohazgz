class AddImgToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :img, :string
  end
end
