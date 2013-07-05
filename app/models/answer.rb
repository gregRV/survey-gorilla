class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  # Remember to create a migration!
end
