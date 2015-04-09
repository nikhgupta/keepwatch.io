class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :tracker, index: true, foreign_key: true
      t.integer :loggable_id
      t.string :loggable_type

      t.timestamps null: false
    end
  end
end
