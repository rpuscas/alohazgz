class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.integer :postal
      t.string :phone
      t.string :email
      t.string :url
      t.text :accesibilidad
      t.text :comment
      t.string :categoria
      t.integer :habitaciones
      t.integer :camas
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
