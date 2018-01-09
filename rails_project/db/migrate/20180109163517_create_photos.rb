class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.string     :public_id

      t.timestamps null: false
    end
  end
end
