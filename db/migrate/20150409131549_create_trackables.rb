class CreateTrackables < ActiveRecord::Migration
  def change
    create_table :trackables do |t|
      t.references :provider, index: true, foreign_key: true
      t.string :type
      t.string :auth_dependent     # type of authentication to use - shuold be polymorphic

      t.timestamps null: false
    end
  end
end
