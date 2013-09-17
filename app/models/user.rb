class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :verified
  
  attr_accessor :password
  # attr_accessor :registration_token
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email address"
  before_create :reg_token

  
  def self.authenticate(email, password)
    user = find_by_email(email)
    user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) ? user : nil
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def reg_token
    self.registration_token = SecureRandom.urlsafe_base64(20)
  end

  def self.verify_email(email_token)
    # raise email_token.inspect
    user = find_by_registration_token(email_token)
    if user
      user.update_attribute(:verified, true)
      user
    end
  end
end
