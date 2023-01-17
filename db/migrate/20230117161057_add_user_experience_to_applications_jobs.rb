# frozen_string_literal: true

# AddUserExperienceToApplicationsJobs added new column
class AddUserExperienceToApplicationsJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :applications_jobs, :user_experience, :text
  end
end
