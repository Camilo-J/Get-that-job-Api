class AddColumnInteretToApplicationJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :applications_jobs, :interest, :text
  end
end
