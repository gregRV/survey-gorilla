class User < ActiveRecord::Base
  include BCrypt
  has_many :surveys, foreign_key: :creator_id
  has_many :answers
  validate :password, presence: true
  validate :email, presence: true


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password=Password.create(new_password)
    self.password_hash=@password
  end

  def authenticate(password)
    self.password == password
  end
  # Remember to create a migration!

end
