class Company < ActiveRecord::Base
  unloadable

  has_many :users, foreign_key: :companies_id
  has_many :projects, foreign_key: :companies_id
  # ensure email address in the database is downcase
  mount_uploader :avatar, AvatarUploader
  before_save :downcase_email
   # validates the presence of data and length of name , format of email
  
  validates :name, presence: true, length: {maximum: 60}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :description, presence: true
  validates :contact_no, presence: true

  private
    def downcase_email
  	  self.email = email.downcase
    end
end
