class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 3}
  validates :email, presence: true, length: { maximum: 50 }
  has_many :reviews
  has_secure_password


  def self.authenticate_with_credentials(email, password)
    email1 = email.strip
    email1 = email1.downcase
    @user = User.where("lower(email) = ?", email1)

    if @user && @user.length > 0 && @user.first.authenticate(password)

        @user.first
    else
      return nil
    end
  end

end
