class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  validates :user_id, uniqueness: true
  validates :choice_id, uniqueness: true
  # Remember to create a migration!
end
