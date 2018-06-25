class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
    	t.string :description, null: false
    	t.string :status, null: false
        t.timestamps
    end
  end
end