class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :trackables_count

      t.timestamps null: false
    end
  end
end
