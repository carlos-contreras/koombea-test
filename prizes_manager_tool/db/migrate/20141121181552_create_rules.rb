class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :numbers
      t.integer :before
      t.integer :after
      t.references :prize, index: true

      t.timestamps
    end
  end
end
