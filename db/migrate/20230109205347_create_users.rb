class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :phone
      t.date :birthdate
      t.string :linkedin
      t.string :title
      t.text :experience
      t.text :education
      t.string :email
      t.string :name
      t.integer :followings_count

      t.timestamps
    end
  end
end
