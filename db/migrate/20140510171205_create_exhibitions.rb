class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :preview_image
      t.string :venue
      t.string :address
      t.string :web_url
      t.string :tel
      t.string :cost
      t.string :description

      t.timestamps
    end
  end
end
