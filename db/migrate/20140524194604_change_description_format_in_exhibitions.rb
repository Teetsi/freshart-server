class ChangeDescriptionFormatInExhibitions < ActiveRecord::Migration
  def change
    change_column :exhibitions, :description, :text
  end
end
