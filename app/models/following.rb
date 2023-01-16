class Following < ApplicationRecord
  # Associations
  belongs_to :user, counter_cache: true
  belongs_to :followable, polymorphic: true

  # Validations
  validates :user_id, presence:true, uniqueness: {scope: [:followable_type, :followable_id]}

  # Callbacks
end
