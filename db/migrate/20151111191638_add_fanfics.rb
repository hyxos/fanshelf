class AddFanfics < ActiveRecord::Migration
  def change
    create_table :fanfic do |t|
      t.belongs_to :shelf, index: true
      t.string :title
      t.string :author
      t.string :url
      t.timestamps null: false
    end
  end
end
