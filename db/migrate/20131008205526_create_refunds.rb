class CreateRefunds < ActiveRecord::Migration
  def change
    create_table :refunds do |t|
      t.string :order
      t.string :status

      t.timestamps
    end
  end
end
