class CreateApplicationsJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :applications_jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.integer :state, default: 0, null: false

      t.timestamps
    end
  end
end
