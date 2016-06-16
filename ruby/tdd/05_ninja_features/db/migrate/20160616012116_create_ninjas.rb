class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
