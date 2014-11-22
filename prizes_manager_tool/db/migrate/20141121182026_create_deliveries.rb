class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :subscriber, index: true
      t.references :prize, index: true

      t.timestamps
    end
  end
end
