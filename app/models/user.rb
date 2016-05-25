class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  max_paginates_per 100

  def full_name
    "#{firstname} #{lastname}"
  end



end
