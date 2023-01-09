class Following < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :followable, polymorphic: true
end
