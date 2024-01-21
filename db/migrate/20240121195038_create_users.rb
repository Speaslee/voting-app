class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :zipcode

      t.timestamps
    end
  end
end