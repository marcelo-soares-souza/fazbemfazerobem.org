class AddLatitudeAndLongitudeToEntidades < ActiveRecord::Migration[5.0]
  def change
    add_column :entidades, :latitude, :float
    add_column :entidades, :longitude, :float
  end
end
