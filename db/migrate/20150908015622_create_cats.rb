class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :url
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
