class AddDetailsToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :times, :string
    add_column :exhibitions, :email, :string
  end
end
