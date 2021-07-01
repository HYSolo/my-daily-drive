class CreateDrives < ActiveRecord::Migration[6.0]
  def change
    create_table :drives do |t|
      t.string :name, default: 'My Daily Drive'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
