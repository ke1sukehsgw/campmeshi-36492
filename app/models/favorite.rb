class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_uniquness_of :tweet_id, scope: :user_id
end
