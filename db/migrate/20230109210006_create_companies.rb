class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
