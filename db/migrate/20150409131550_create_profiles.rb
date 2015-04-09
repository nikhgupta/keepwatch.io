class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :provider, index: true, foreign_key: true
      t.string :identifier

      t.timestamps null: false
    end
  end
end
