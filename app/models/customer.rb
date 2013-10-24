class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :password_resets

  validates_presence_of :name, :email

  has_secure_password validations: false

  def send_password_reset
    generate_token(:password_reset_token)
    self.reset_password_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Customer.exists?(column => self[column])
  end

end