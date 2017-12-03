class User < ApplicationRecord
  has_many :orders


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.send_new_user_message(self).deliver
  end

end
