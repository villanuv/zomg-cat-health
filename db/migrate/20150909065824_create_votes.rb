class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :option
      t.string :ip_address
      t.references :cat, index: true

      t.timestamps
    end
  end
end
