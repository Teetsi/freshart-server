class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.datetime :entry_date
      t.belongs_to :list
      t.belongs_to :exhibition

      t.timestamps
    end
  end
end
