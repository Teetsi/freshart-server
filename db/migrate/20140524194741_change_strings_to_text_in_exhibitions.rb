class ChangeStringsToTextInExhibitions < ActiveRecord::Migration
  def change
    change_column :exhibitions, :title, :text
    change_column :exhibitions, :preview_image, :text
    change_column :exhibitions, :address, :text
    change_column :exhibitions, :web_url, :text
    change_column :exhibitions, :venue, :text
  end
end
