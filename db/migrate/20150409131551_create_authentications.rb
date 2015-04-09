class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.string :token
      t.string :secret
      t.string :type

      t.timestamps null: false
    end
  end
end
