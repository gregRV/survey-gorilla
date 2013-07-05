class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :answers, through: :choices
  has_many :users, through: :answers
  def answered_by?(user)

  end
  # Remember to create a migration!
end
