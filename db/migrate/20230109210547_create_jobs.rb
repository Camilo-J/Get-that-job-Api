class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :type
      t.float :min_salary
      t.float :max_salary
      t.text :requirements
      t.text :optional_requirements
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
