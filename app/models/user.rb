class User < ActiveRecord::Base
  has_many :surveys, foreign_key: :creator_id
  has_many :answers

  # Remember to create a migration!
end
