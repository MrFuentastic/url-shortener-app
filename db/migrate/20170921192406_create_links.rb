class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :target_url

      t.timestamps
    end
  end
end
