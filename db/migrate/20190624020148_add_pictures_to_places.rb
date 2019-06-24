class AddPicturesToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :pictures, :json
  end
end
