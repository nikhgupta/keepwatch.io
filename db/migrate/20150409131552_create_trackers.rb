class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.references :trackable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
